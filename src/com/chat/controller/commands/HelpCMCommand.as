/**
 * Created by kvint on 13.11.14.
 */
package com.chat.controller.commands {
	import flash.utils.Dictionary;

	import org.as3commons.lang.DictionaryUtils;

	public class HelpCMCommand extends CMCommand {

		override protected function _execute():void {
			var commandsMap:Dictionary = params[0];
			var keys:Array = DictionaryUtils.getKeys(commandsMap);
			for (var i:int = 0; i < keys.length; i++) {
				print(keys[i]);
			}
		}
	}
}
