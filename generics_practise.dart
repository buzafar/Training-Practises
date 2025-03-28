// DART GENERICS PRACTISE

/*
📝 Task 1: Create a Generic Stack Class

Implement a generic class Stack<T> with the following methods:
	•	push(T value): Adds an element to the stack.
	•	pop(): Removes and returns the last element.
	•	isEmpty: Returns true if the stack is empty.
*/
class Stack<T> {
  List<T> stack = <T>[];
  bool isEmpty = true;

  void push(T newElement) {
    stack.add(newElement);
    isEmpty = false;
  }

  T pop() {
    T lastElement = stack.last;

    stack.removeLast();

    if (stack.length == 0) {
      isEmpty = true;
    }

    return lastElement;
  } 
}


/*
📝 Task 2: Create a Generic Key-Value Store

Create a generic class KeyValueStore<K, V> that stores key-value pairs.
	•	void add(K key, V value): Adds a key-value pair.
	•	V? getValue(K key): Returns the value for the given key.

*/
class KeyValueStore<T, V> {
  Map<T, V> myMap = <T, V>{};

  void add(T key, V value) {
    myMap[key] = value;
  }

  V? getValue(T key) {
    return myMap[key];
  }
}


/*
📝 Task 3: Generic Function for List Operations

Write a generic function findMax<T extends num>(List<T> numbers) that returns the largest number in a list.

*/
T findMax<T extends num>(List<T> list) {
  T largest = list[0];
  
  for (T element in list) {
    if (element > largest) {
      largest = element;
    }
  }

  return largest;
}


/*
📝 Task 4: Generic Interface for Data Storage

Create an abstract class Storage<T> with the following methods:
	•	void save(T item): Stores an item.
	•	T? retrieve(): Retrieves the last stored item.

Then, create a class LocalStorage<String> that implements Storage<String>.
*/
abstract class Storage<T> {
  void save(T item);

  T? retrieve();
}

class LocalStorage<T> implements Storage<T> {
  List<T> storage = <T>[];

  void save(T item) {
    print(T);
    storage.add(item);
  }

  T? retrieve() {
    return storage.lastOrNull;
  }
}


/*
📝 Task 5: Generic Filtering Function

Write a generic function filterList<T>(List<T> list, bool Function(T) test) that filters a list based on a condition.
*/
List<T> filterList<T>(List<T> list, bool Function(T) filterFunction) {
  return list.where(filterFunction).toList();
}


void main() {
  //1
  var intStack = Stack<int>();
  intStack.push(10);
  intStack.push(20);
  print(intStack.pop()); // Output: 20
  print(intStack.isEmpty); // Output: false

  //2
  var store = KeyValueStore<String, int>();
  store.add("apples", 10);
  print(store.getValue("apples")); // Output: 10

  //3
  print(findMax([4, 8, 1, 3])); // Output: 8
  print(findMax([4.5, 2.1, 9.7])); // Output: 9.7

  //4
  var storage = LocalStorage();
  storage.save("Hello");
  print(storage.retrieve()); 
  
  //5
  var numbers = [1, 2, 3, 4, 5, 6];
  var evenNumbers = filterList(numbers, (n) => n % 2 == 0);
  print(evenNumbers); // Output: [2, 4, 6]
}


/*Done
Questions I have: 

1.What if the user using our class or function does not specify the type?
Answer: 
✅ If the type is not specified, Dart infers it (defaulting to dynamic if unrestricted).
✅ To enforce type safety, use T extends Object or set a default type (T = int).
✅ In functions, restricting T (T extends num) prevents invalid types at compile-time.

*/
