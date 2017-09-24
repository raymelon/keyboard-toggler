using Gtk;

public class Main {
  class AppStatusIcon : Window {
    private StatusIcon trayicon;
    private Gtk.Menu menuSystem;
    private AboutDialog aboutDialog;

    public AppStatusIcon() {
      /* Create tray icon */
      trayicon = new StatusIcon.from_icon_name("gtk-home");
      trayicon.set_tooltip_text ("Tray");
      trayicon.set_visible(true);

      trayicon.activate.connect(about_clicked);

      create_menuSystem();
      trayicon.popup_menu.connect(menuSystem_popup);
    }

    /* Create menu for right button */
    public void create_menuSystem() {
      menuSystem = new Gtk.Menu();

      var box = new Box (Orientation.HORIZONTAL, 6);
      var icon = new Gtk.Image.from_icon_name ("gtk-about", IconSize.MENU);
      var label = new Label ("About");
      var menuItem = new Gtk.MenuItem();
      box.add (icon);
      box.add (label);
      menuItem.add (box);
      menuItem.activate.connect(about_clicked);
      menuSystem.append(menuItem);

      box = new Box (Orientation.HORIZONTAL, 6);
      icon = new Gtk.Image.from_icon_name ("gtk-quit", IconSize.MENU);
      label = new Label ("Quit");
      menuItem = new Gtk.MenuItem();
      box.add (icon);
      box.add (label);
      menuItem.add (box);
      menuItem.activate.connect(Gtk.main_quit);
      menuSystem.append(menuItem);

      menuSystem.show_all();
    }

    private void menuSystem_popup(uint button, uint time) {
      menuSystem.popup(null, null, null, button, time);
    }

    private void about_clicked() {
      if (aboutDialog == null) {
        aboutDialog = new AboutDialog();
        aboutDialog.set_version("0.0.0");
        aboutDialog.set_program_name("Tray");
        aboutDialog.set_comments("Tray utility");
        aboutDialog.set_copyright("vala");
      }

      aboutDialog.run();
      aboutDialog.hide();
    }
  }

  public static int main (string[] args) {
    Gtk.init(ref args);
    var App = new AppStatusIcon();
    App.hide();
    Gtk.main();
    return 0;
  }
}