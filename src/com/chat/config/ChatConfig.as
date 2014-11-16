/**
 * Created by kvint on 01.11.14.
 */
package com.chat.config {
	import com.chat.IChat;
	import com.chat.Chat;
	import com.chat.controller.ChatController;
	import com.chat.controller.commands.ClearCMCommand;
	import com.chat.controller.commands.HelpCMCommand;
	import com.chat.controller.commands.message.MarkAsReadCMCommand;
	import com.chat.controller.commands.message.OnNewMessageCMCommand;
	import com.chat.controller.commands.message.SendMessageStateCMCommand;
	import com.chat.controller.commands.roster.AddUserCMCommand;
	import com.chat.controller.commands.roster.RemoveUserCMCommand;
	import com.chat.controller.commands.roster.RosterCMCommand;
	import com.chat.controller.commands.message.SendPrivateMessageCMCommand;
	import com.chat.controller.commands.TraceCMCommand;
	import com.chat.controller.commands.muc.RoomCMCommand;
	import com.chat.controller.commands.muc.RoomInfoCMCommand;
	import com.chat.controller.commands.muc.RoomJoinCMCommand;
	import com.chat.controller.commands.muc.SendRoomMessageCMCommand;
	import com.chat.controller.commands.roster.RosterInfoCommand;
	import com.chat.events.CommunicatorCommandEvent;
	import com.chat.model.ChatModel;
	import com.chat.model.communicators.CommunicatorProvider;
	import com.chat.model.communicators.ICommunicatorProvider;

	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;

	public class ChatConfig implements IConfig {

		[Inject]
		public var context:IContext;

		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var commandMap:IEventCommandMap;

		public function configure():void {
			mapMembership();
			mapView();
			mapCommands();
		}


		private function mapMembership():void {
			injector.map(IChat).toSingleton(Chat);
			injector.map(ChatModel).toSingleton(ChatModel);
			injector.map(ChatController).toSingleton(ChatController);
			injector.map(ICommunicatorProvider).toSingleton(CommunicatorProvider);
		}
		private function mapCommands():void {
			commandMap.map(CommunicatorCommandEvent.PRIVATE_MESSAGE).toCommand(SendPrivateMessageCMCommand);
			commandMap.map(CommunicatorCommandEvent.TRACE).toCommand(TraceCMCommand);
			commandMap.map(CommunicatorCommandEvent.CLEAR).toCommand(ClearCMCommand);
			commandMap.map(CommunicatorCommandEvent.HELP).toCommand(HelpCMCommand);

			commandMap.map(CommunicatorCommandEvent.ROOM).toCommand(RoomCMCommand);
			commandMap.map(CommunicatorCommandEvent.ROOM_INFO).toCommand(RoomInfoCMCommand);
			commandMap.map(CommunicatorCommandEvent.ROOM_MESSAGE).toCommand(SendRoomMessageCMCommand);
			commandMap.map(CommunicatorCommandEvent.ROOM_JOIN).toCommand(RoomJoinCMCommand);

			commandMap.map(CommunicatorCommandEvent.ROSTER).toCommand(RosterCMCommand);
			commandMap.map(CommunicatorCommandEvent.ROSTER_ADD).toCommand(AddUserCMCommand);
			commandMap.map(CommunicatorCommandEvent.ROSTER_REMOVE).toCommand(RemoveUserCMCommand);
			commandMap.map(CommunicatorCommandEvent.ROSTER_INFO).toCommand(RosterInfoCommand);

			commandMap.map(CommunicatorCommandEvent.SEND_MESSAGE_STATE).toCommand(SendMessageStateCMCommand);
			commandMap.map(CommunicatorCommandEvent.ON_MESSAGE_RECEIVED).toCommand(OnNewMessageCMCommand);
			commandMap.map(CommunicatorCommandEvent.MARK_AS_RECEIVED).toCommand(MarkAsReadCMCommand);
		}

		private function mapView():void {
//			mediatorMap.map(HistoryCommunicatorView).toMediator(HistoryCommunicatorMediator);
			//mediatorMap.map(TeamCommunicatorView).toMediator(TeamCommunicatorMediator);
			//mediatorMap.map(GlobalCommunicatorView).toMediator(GlobalCommunicatorMediator);

		}
	}
}
