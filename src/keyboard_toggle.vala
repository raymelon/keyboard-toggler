/* keyboard_toggle.vala
 * 
 * Copyright (C) 2017 Raymel Francisco
 * 
 */

public class Application : Gtk.Window {

	public Application () {

		this.title = "Toggler";
		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect (Gtk.main_quit);
		this.resizable = false;

		// StatusIcon is deprecated
		//Gtk.StatusIcon tray_icon = new Gtk.StatusIcon.from_icon_name("gtk-home");
		//tray_icon.set_tooltip_text ("Keyboard Toggler");
		//tray_icon.set_visible (true);

		Gtk.Box _box_vert = new Gtk.Box (Gtk.Orientation.VERTICAL, 3);
		_box_vert.homogeneous = true;

		Gtk.Box _box_hor = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 3);
		_box_hor.homogeneous = true;

		Gtk.Box _dashbar = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 4);
		_dashbar.homogeneous = true;

		Gtk.Switch _switch = new Gtk.Switch ();
		
		// Gtk.Button _btn_settings = new Gtk.Button ();
		// Gtk.Image _btn_settings_img = new Gtk.Image ();

		// _btn_settings_img.set_from_file ("/home/raymelon/Documents/side-projects/keyboard-toggler/bin/gear_16.png");
		// _btn_settings_img.icon_size = Gtk.IconSize.BUTTON;
		// _btn_settings.add (_btn_settings_img);

		_dashbar.add (new Gtk.Label (""));
		_dashbar.add (new Gtk.Label (""));
		_dashbar.add (new Gtk.Label (""));
		// _dashbar.add (_btn_settings);

		_box_hor.add (new Gtk.Label (""));
		_box_hor.add (_switch);
		_box_hor.add (new Gtk.Label (""));

		_box_vert.add (_dashbar);
		_box_vert.add (_box_hor);
		_box_vert.add (new Gtk.Label (""));
		
		this.add (_box_vert);

		_switch.notify["active"].connect (() => {
			if (_switch.active) {
				GLib.stdout.printf ("Keyboard enabled!\n");
				Posix.system("xinput set-prop 10 'Device Enabled' 1; sleep 1");
				Posix.system("xmodmap -e 'add mod3 = Scroll_Lock'");
			} else {
				GLib.stdout.printf ("Keyboard disbaled!\n");
				Posix.system("xinput set-prop 10 'Device Enabled' 0");
			}
		});

		_switch.set_active (true);
	}

	public static int main (string[] args) {
		Gtk.init (ref args);


		AppIndicator.Indicator tray_icon = new AppIndicator.Indicator ("Toggler", "indicator-messages", AppIndicator.IndicatorCategory.HARDWARE);
		
		if (!(tray_icon is AppIndicator.Indicator)) {
			stdout.printf ("NOT an App Indicator. Babye. :(");
			return -1;
		} else {
			stdout.printf ("An App Indicator. No worries. ;)");
		}

		tray_icon.set_attention_icon("/home/raymelon/Downloads/Icon-RPGKeyboard-600x600.png");
		tray_icon.set_status (AppIndicator.IndicatorStatus.ATTENTION);



		Application app = new Application ();


		app.show_all ();
		Gtk.main ();
		return 0;
	}
}
