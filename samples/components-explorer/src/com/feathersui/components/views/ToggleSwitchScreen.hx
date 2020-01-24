package com.feathersui.components.views;

import feathers.events.FeathersEvent;
import feathers.layout.VerticalAlign;
import feathers.layout.HorizontalAlign;
import feathers.layout.HorizontalLayout;
import feathers.controls.Label;
import openfl.events.Event;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.controls.Button;
import feathers.controls.ToggleSwitch;
import feathers.controls.LayoutGroup;
import feathers.controls.Panel;

class ToggleSwitchScreen extends Panel {
	private var toggle:ToggleSwitch;
	private var selectedToggle:ToggleSwitch;

	override private function initialize():Void {
		super.initialize();

		var layout = new HorizontalLayout();
		layout.horizontalAlign = CENTER;
		layout.verticalAlign = MIDDLE;
		layout.gap = 20;
		this.layout = layout;

		this.headerFactory = function():LayoutGroup {
			var header = new LayoutGroup();
			header.variant = LayoutGroup.VARIANT_TOOL_BAR;
			header.layout = new AnchorLayout();

			var headerTitle = new Label();
			headerTitle.variant = Label.VARIANT_HEADING;
			headerTitle.text = "Toggle Switch";
			headerTitle.layoutData = AnchorLayoutData.center();
			header.addChild(headerTitle);

			var backButton = new Button();
			backButton.text = "Back";
			backButton.layoutData = new AnchorLayoutData(null, null, null, 10, null, 0);
			backButton.addEventListener(FeathersEvent.TRIGGERED, backButton_triggeredHandler);
			header.addChild(backButton);

			return header;
		};

		this.toggle = new ToggleSwitch();
		this.toggle.layoutData = AnchorLayoutData.center();
		this.toggle.addEventListener(Event.CHANGE, toggleSwitch_changeHandler);
		this.addChild(this.toggle);
	}

	private function toggleSwitch_changeHandler(event:Event):Void {
		trace("ToggleSwitch selected change: " + this.toggle.selected);
	}

	private function backButton_triggeredHandler(event:FeathersEvent):Void {
		this.dispatchEvent(new Event(Event.COMPLETE));
	}
}