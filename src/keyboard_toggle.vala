

public class Application : Gtk.Window {
	public Application () {

		this.title = "Toggler";
		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect (Gtk.main_quit);
		this.set_default_size (200, 100);
		//this.resizable = false;

		Gtk.Box _box_vert = new Gtk.Box (Gtk.Orientation.VERTICAL, 3);
		_box_vert.homogeneous = true;

		Gtk.Box _box_hor = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 3);
		_box_hor.homogeneous = true;

		Gtk.Switch _switch = new Gtk.Switch ();
		Gtk.Label _label1 = new Gtk.Label ("");
		Gtk.Label _label2 = new Gtk.Label ("");
		Gtk.Label _label3 = new Gtk.Label ("");
		Gtk.Label _label4 = new Gtk.Label ("");

		_box_hor.add (_label3);
		_box_hor.add (_switch);
		_box_hor.add (_label4);

		_box_vert.add (_label1);
		_box_vert.add (_box_hor);
		_box_vert.add (_label2);
		
		this.add (_box_vert);

		_switch.notify["active"].connect (() => {
			if (_switch.active) {
				GLib.stdout.printf ("Keyboard enabled!\n");
				Posix.system("xinput set-prop 10 'Device Enabled' 1");
			} else {
				GLib.stdout.printf ("Keyboard disbaled!\n");
				Posix.system("xinput set-prop 10 'Device Enabled' 0");
			}
		});

		_switch.set_active (true);
	}

	public static int main (string[] args) {
		Gtk.init (ref args);

		Application app = new Application ();
		app.show_all ();
		Gtk.main ();
		return 0;
	}
}
