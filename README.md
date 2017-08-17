# Keyboard Toggler
Simple GUI app to enable or disable your keyboard.

Useful when you want to clean your keyboard a bit but too lazy to reach out its cable.

Built with and primarily for [Elementary OS](https://elementary.io/), using it's official language [Vala](https://wiki.gnome.org/Projects/Vala)

![alt screenshot](https://raw.githubusercontent.com/raymelon/keyboard-toggler/master/media/caps/toggler1.0.0.png)

### You may need to install these if things don't work:

- xinput
 
      sudo apt-get install xinput

- Vala 
  > *If you are using Elementary OS, disregard this one.*
  
      sudo add-apt-repository ppa:vala-team
      sudo apt update
      sudo apt install valac
      sudo apt install vala-0.36-doc
      sudo apt install valac-dbg
      
### WARNING!

Keyboard device number varies per computer. Do not use this yet if you intend not to modify the code. Stay tuned for the initial release. Cheers!
