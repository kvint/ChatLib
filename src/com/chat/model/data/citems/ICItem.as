/**
 * Created by kvint on 13.11.14.
 */
package com.chat.model.data.citems {
	public interface ICItem {

		//TODO: refactor all citems

		function get data():Object;
		function get time():Number;
		function get from():Object;
		function get body():Object;
		function get isRead():Boolean;
		function set isRead(value:Boolean):void;
	}
}
