//1
void runTask(void Function(String, int) function) {
  function("Dart", 10);
}

//2
List<int> filterList(List<int> numbers, bool Function(int) filterFunction) {
  List<int> newList = [];
  numbers.forEach((int currentNumber) {
    if (filterFunction(currentNumber)) {
      newList.add(currentNumber);
    }
  },);
  return newList;
}



Function(int) createMultiplier(int factor) {
  return (int multiplier) {
    return factor*multiplier;
  };
}


void myForEach(List<int> numbers, void Function(int element) function) {
  numbers.forEach((int element) {
    function(element);
  });
}


Future delayedExecution(Duration delay, void Function() action) async {
  Future.delayed(delay).then((value) => action(),);
}



void swap<T extends String>(int a, T b) {
  print("$b, $a");
}



void main() {
  swap(1, "2");
}