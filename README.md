<p align="center">
  <img src="https://github.com/jannelson36/AirBnB_clone/blob/main/assets/abnb_logo.png" alt="ABnB logo">
</p>

<h1 align="center">ABnB</h1>
<p align="center">An AirBnB clone.</p>

---

## Description :house:

ABnB is the first step towards building my first full web application: the AirBnB clone. 

The project currently implements 
* Create a new object (ex: a new User or a new Place)
* Retrieve an object from a file, a database etc…
* Do operations on objects (count, compute stats, etc…)
* Update attributes of an object
* Destroy an object

## Classes :cl:

ABnB utilizes the following classes:

|     | BaseModel | FileStorage | User | State | City | Amenity | Place | Review |
| --- | --------- | ----------- | -----| ----- | -----| ------- | ----- | ------ |
| **PUBLIC INSTANCE ATTRIBUTES** | `id`<br>`created_at`<br>`updated_at` | | Inherits from `BaseModel` | Inherits from `BaseModel` | Inherits from `BaseModel` | Inherits from `BaseModel` | Inherits from `BaseModel` | Inherits from `BaseModel` |
| **PUBLIC INSTANCE METHODS** | `save`<br>`to_dict` | `all`<br>`new`<br>`save`<br>`reload` | "" | "" | "" | "" | "" | "" |
| **PUBLIC CLASS ATTRIBUTES** | | | `email`<br>`password`<br>`first_name`<br>`last_name`| `name` | `state_id`<br>`name` | `name` | `city_id`<br>`user_id`<br>`name`<br>`description`<br>`number_rooms`<br>`number_bathrooms`<br>`max_guest`<br>`price_by_night`<br>`latitude`<br>`longitude`<br>`amenity_ids` | `place_id`<br>`user_id`<br>`text` | 
| **PRIVATE CLASS ATTRIBUTES** | | `file_path`<br>`objects` | | | | | | |

## Storage :baggage_claim:

The above classes are handled by the abstracted storage engine defined in the 
[FileStorage](./models/engine/file_storage.py) class.

Every time the backend is initialized, ABnB instantiates an instance of 
`FileStorage` called `storage`. The `storage` object is loaded/re-loaded from 
any class instances stored in the JSON file `file.json`. As class instances are 
created, updated, or deleted, the `storage` object is used to register 
corresponding changes in the `file.json`.

## Console :computer:

The console is a command line interpreter that permits management of the backend 
of ABnB. It can be used to handle and manipulate all classes utilized by 
the application (achieved by calls on the `storage` object defined above).

### Using the Console

The ABnB console can be run both interactively and non-interactively. 
To run the console in non-interactive mode, pipe any command(s) into an execution 
of the file `console.py` at the command line.

```
$ echo "help" | ./console.py
(hbnb) 
Documented commands (type help <topic>):
========================================
EOF  all  count  create  destroy  show  update  help  quit

(hbnb) 
$
```

Alternatively, to use the ABnB console in interactive mode, run the 
file `console.py`:

```
$ ./console.py
```

To quit the console, enter the command `quit`, or input an EOF signal 
(`ctrl-D`).

```
$ ./console.py
(hbnb) quit
$
```

```
$ ./console.py
(hbnb) EOF
$
```

### Console Commands

The ABnB console supports the following commands:

* **create**
  * Usage: `create <class>`

Creates a new instance of a given class. The class' ID is printed and 
the instance is saved to the file `file.json`.

```
$ ./console.py
(hbnb) create BaseModel
f9043358-6c63-48b7-a8e4-b9a22b1f0dbf
(hbnb) quit
$ cat file.json ; echo ""
{"BaseModel.f9043358-6c63-48b7-a8e4-b9a22b1f0dbf": {"id": "f9043358-6c63-48b7-a8e4-b9a22b1f0dbf", "created_at": "2023-02-12T01:25:16.869286", "updated_at": "2023-02-12T01:25:16.869300", "__class__": "BaseModel"}}
```

* **show**
  * Usage: `show <class> <id>` or `<class>.show(<id>)`

Prints the string representation of a class instance based on a given id.

```
$ ./console.py
(hbnb) create User
6d51c7ae-0da0-4cc6-82d5-37c677f45123
(hbnb)
(hbnb) show User 6d51c7ae-0da0-4cc6-82d5-37c677f45123
[User] (6d51c7ae-0da0-4cc6-82d5-37c677f45123) {'id': '6d51c7ae-0da0-4cc6-82d5-37c677f45123', 'created_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352989), 'updated_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352996)}
(hbnb) 
(hbnb) User.show(6d51c7ae-0da0-4cc6-82d5-37c677f45123)
[User] (6d51c7ae-0da0-4cc6-82d5-37c677f45123) {'id': '6d51c7ae-0da0-4cc6-82d5-37c677f45123', 'created_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352989), 
'updated_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352996)}
(hbnb) 
```
* **destroy**
  * Usage: `destroy <class> <id>` or `<class>.destroy(<id>)`

Deletes a class instance based on a given id. The storage file `file.json` 
is updated accordingly.

```
$ ./console.py
(hbnb) create State
95172768-4f50-47f2-834f-2a7621c39a34
(hbnb) create Place
613792f9-4727-4c1d-acb4-b6ee2d87c5bb
(hbnb)
(hbnb) destroy State 95172768-4f50-47f2-834f-2a7621c39a34
(hbnb) Place.destroy(613792f9-4727-4c1d-acb4-b6ee2d87c5bb)
(hbnb) quit
$ cat file.json ; echo ""
{}
```

* **all**
  * Usage: `all` or `all <class>` or `<class>.all()`

Prints the string representations of all instances of a given class. If no 
class name is provided, the command prints all instances of every class.

```
$ ./console.py
(hbnb) create BaseModel
4b7ccee8-9e95-460e-a4be-3adf1d55a0ce
(hbnb) create BaseModel
323ae89a-4fb8-4c34-b328-8b6e4587bfb6
(hbnb) create User
010d7a23-f9df-477c-b8b3-fd8609f6f032
(hbnb) create User
d7904ac3-4e64-4f57-b485-71c6016f2741
(hbnb)
(hbnb) all BaseModel
["[BaseModel] (f9043358-6c63-48b7-a8e4-b9a22b1f0dbf) {'id': 'f9043358-6c63-48b7-a8e4-b9a22b1f0dbf', 'created_at': datetime.datetime(2023, 2, 12, 1, 25, 16, 869286), 'updated_at': datetime.datetime(2023, 2, 12, 1, 25, 16, 869300)}", "[BaseModel] (4b7ccee8-9e95-460e-a4be-3adf1d55a0ce) {'id': '4b7ccee8-9e95-460e-a4be-3adf1d55a0ce', 'created_at': datetime.datetime(2023, 2, 12, 1, 33, 52, 88632), 'updated_at': datetime.datetime(2023, 2, 12, 1, 33, 52, 88639)}", "[BaseModel] (323ae89a-4fb8-4c34-b328-8b6e4587bfb6) {'id': '323ae89a-4fb8-4c34-b328-8b6e4587bfb6', 'created_at': datetime.datetime(2023, 2, 12, 1, 33, 54, 517896), 'updated_at': datetime.datetime(2023, 2, 12, 1, 33, 54, 517907)}", "[BaseModel] (920309e3-ba97-437b-9be1-323754f19f7c) {'id': '920309e3-ba97-437b-9be1-323754f19f7c', 'created_at': datetime.datetime(2023, 2, 12, 1, 33, 56, 383110), 'updated_at': datetime.datetime(2023, 2, 12, 1, 33, 56, 383118)}"]
(hbnb)
(hbnb) User.all()
["[User] (6d51c7ae-0da0-4cc6-82d5-37c677f45123) {'id': '6d51c7ae-0da0-4cc6-82d5-37c677f45123', 'created_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352989), 'updated_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352996)}", "[User] (010d7a23-f9df-477c-b8b3-fd8609f6f032) {'id': '010d7a23-f9df-477c-b8b3-fd8609f6f032', 'created_at': datetime.datetime(2023, 2, 12, 1, 34, 31, 328397), 'updated_at': datetime.datetime(2023, 2, 12, 1, 34, 31, 328407)}", "[User] (d7904ac3-4e64-4f57-b485-71c6016f2741) {'id': 'd7904ac3-4e64-4f57-b485-71c6016f2741', 'created_at': datetime.datetime(2023, 2, 12, 1, 34, 33, 427096), 'updated_at': datetime.datetime(2023, 2, 12, 1, 34, 33, 427104)}"]
(hbnb) 
(hbnb) all
["[BaseModel] (f9043358-6c63-48b7-a8e4-b9a22b1f0dbf) {'id': 'f9043358-6c63-48b7-a8e4-b9a22b1f0dbf', 'created_at': datetime.datetime(2023, 2, 12, 1, 25, 16, 869286), 'updated_at': datetime.datetime(2023, 2, 12, 1, 25, 16, 869300)}", "[User] (6d51c7ae-0da0-4cc6-82d5-37c677f45123) {'id': '6d51c7ae-0da0-4cc6-82d5-37c677f45123', 'created_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352989), 'updated_at': datetime.datetime(2023, 2, 12, 1, 27, 14, 352996)}", "[State] (95172768-4f50-47f2-834f-2a7621c39a34) {'id': '95172768-4f50-47f2-834f-2a7621c39a34', 'created_at': datetime.datetime(2023, 2, 12, 1, 32, 16, 626768), 'updated_at': datetime.datetime(2023, 2, 12, 1, 32, 16, 626779)}", "[Place] (613792f9-4727-4c1d-acb4-b6ee2d87c5bb) {'id': '613792f9-4727-4c1d-acb4-b6ee2d87c5bb', 'created_at': datetime.datetime(2023, 2, 12, 1, 32, 44, 249996), 'updated_at': datetime.datetime(2023, 2, 12, 1, 32, 44, 250003)}", "[BaseModel] (4b7ccee8-9e95-460e-a4be-3adf1d55a0ce) {'id': '4b7ccee8-9e95-460e-a4be-3adf1d55a0ce', 'created_at': datetime.datetime(2023, 2, 12, 1, 33, 52, 88632), 'updated_at': datetime.datetime(2023, 2, 12, 1, 33, 52, 88639)}", "[BaseModel] (323ae89a-4fb8-4c34-b328-8b6e4587bfb6) {'id': '323ae89a-4fb8-4c34-b328-8b6e4587bfb6', 'created_at': datetime.datetime(2023, 2, 12, 1, 33, 54, 517896), 'updated_at': datetime.datetime(2023, 2, 12, 1, 33, 54, 517907)}", "[BaseModel] (920309e3-ba97-437b-9be1-323754f19f7c) {'id': '920309e3-ba97-437b-9be1-323754f19f7c', 'created_at': datetime.datetime(2023, 2, 12, 1, 33, 56, 383110), 'updated_at': datetime.datetime(2023, 2, 12, 1, 33, 56, 383118)}", "[User] (010d7a23-f9df-477c-b8b3-fd8609f6f032) {'id': '010d7a23-f9df-477c-b8b3-fd8609f6f032', 'created_at': datetime.datetime(2023, 2, 12, 1, 34, 31, 328397), 'updated_at': datetime.datetime(2023, 2, 12, 1, 34, 31, 328407)}", "[User] (d7904ac3-4e64-4f57-b485-71c6016f2741) {'id': 'd7904ac3-4e64-4f57-b485-71c6016f2741', 'created_at': datetime.datetime(2023, 2, 12, 1, 34, 33, 427096), 'updated_at': datetime.datetime(2023, 2, 12, 1, 34, 33, 427104)}"]
(hbnb) 
```

* **count**
  * Usage: `count <class>` or `<class>.count()`

Retrieves the number of instances of a given class.

```
$ ./console.py
(hbnb) create Place
f738d0c2-2343-48cb-a107-b5b91d50ff49
(hbnb) create Place
296509fc-46bd-4da5-9fdd-eebb98d9b45b
(hbnb) create City
9d4fc698-d115-4c31-8674-b62622baa41e
(hbnb) 
(hbnb) count Place
3
(hbnb) city.count()
1
(hbnb) 
```

* **update**
  * Usage: `update <class> <id> <attribute name> "<attribute value>"` or
`<class>.update(<id>, <attribute name>, <attribute value>)` or `<class>.update(
<id>, <attribute dictionary>)`.

Updates a class instance based on a given id with a given key/value attribute 
pair or dictionary of attribute pairs. If `update` is called with a single 
key/value attribute pair, only "simple" attributes can be updated (ie. not 
`id`, `created_at`, and `updated_at`). However, any attribute can be updated by 
providing a dictionary.

```
$ ./console.py
(hbnb) create User
b50f9566-f81f-412e-b103-10e7bcd0e393
(hbnb)
(hbnb) update User 6f348019-0499-420f-8eec-ef0fdc863c02 first_name "ALX"
(hbnb) show User 6f348019-0499-420f-8eec-ef0fdc863c02
[User] (b50f9566-f81f-412e-b103-10e7bcd0e393) {'id': 'b50f9566-f81f-412e-b103-10e7bcd0e393', 'created_at': datetime.datetime(2023, 2, 12, 1, 39, 24, 296195), 'updated_at': datetime.datetime(2023, 2, 12, 1, 39, 24, 296203), 'first_name': 'ALX'}
(hbnb)
(hbnb) User.update(6f348019-0499-420f-8eec-ef0fdc863c02, address, "Nairobi, Kenya")
(hbnb) User.show(6f348019-0499-420f-8eec-ef0fdc863c02)
[User] (b50f9566-f81f-412e-b103-10e7bcd0e393) {'id': 'b50f9566-f81f-412e-b103-10e7bcd0e393', 'created_at': datetime.datetime(2023, 2, 12, 1, 39, 24, 296195), 'updated_at': datetime.datetime(2023, 2, 12, 1, 39, 24, 296203), 'first_name': 'ALX', 'address': 'Nairobi, Kenya'}
(hbnb)
(hbnb) User.update(b50f9566-f81f-412e-b103-10e7bcd0e393, {'email': 'alx@se.com', 'last_name': 'School'})
[User] (b50f9566-f81f-412e-b103-10e7bcd0e393) {'id': 'b50f9566-f81f-412e-b103-10e7bcd0e393', 'created_at': datetime.datetime(2023, 2, 12, 1, 39, 24, 296195), 'updated_at': datetime.datetime(2023, 2, 12, 1, 39, 24, 296203), 'first_name': 'ALX', 'address': 'Nairobi, Kenya', 'email': 'alx@se.com', 'last_name': 'School'}
(hbnb) 
```

## Testing :straight_ruler:

Unittests for the ABnB project are defined in the [tests](./tests) 
folder. To run the entire test suite simultaneously, execute the following command:

```
$ python3 unittest -m discover tests
```

Alternatively, you can specify a single test file to run at a time:

```
$ python3 unittest -m tests/test_console.py
```

## Authors :black_nib:
* **Jan Nelson** <[jannelson36](https://github.com/jannelson36)>
