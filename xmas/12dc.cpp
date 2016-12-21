#include <iostream>
using namespace std;

int main()
{

  string presents[12] = {"Partridge in a pear tree", "Turtle doves",
                         "French hens", "Calling birds", "Golden Rings",
                         "Geese a laying", "Swans a swimming", "Maids a milking",
                         "Ladies dancing", "Lords a leaping", "Pipers piping",
                         "Drummers drumming"};

  bool showAnd = false;

  for (int d=0; d<12; d++) {
    cout << "On the " << d + 1 << " day of Christmas\n";
    cout << "my true love sent to me:\n";
    for (int p=d; p>=0; p--) {
      if (p == 0 && showAnd) {
        cout << "and " << p + 1 << " " << presents[p] << "\n";
      } else {
        cout << p + 1 << " " << presents[p] << "\n";
        showAnd = true;
      }
    }
  }
}
