import '../classes/json_data.dart';

final directoryStructure = directoriesFromJson('''
 [{
 		"Id": 1,
 		"Name": "Defending Islam",
 		"Type": 0,
 		"children": [{
 			"Id": 2,
 			"Name": "Age of Aisha RA",
 			"Type": 0,
 			"children": [{
 					"Id": 3,
 					"Name": "Krishna abducts and marries 8 year old Rukmini",
 					"Type": 1,
 					"children": null
 				},
 				{
 					"Id": 4,
 					"Name": "Ideal age of Marriage in Hinduism",
 					"Type": 1,
 					"children": null
 				},
 				{
 					"Id": 5,
 					"Name": "Sita was 6 when she married Ram",
 					"Type": 1,
 					"children": null
 				}
 			]
 		}]
 	},
 	{
 		"Id": 6,
 		"Name": "Hindu gods",
 		"Type": 0,
 		"children": [{
 			"Id": 7,
 			"Name": "Wierd things Hindus worship",
 			"Type": 0,
 			"children": [{
 				"Id": 8,
 				"Name": "Flying Donkey/Horse thing",
 				"Type": 1,
 				"children": null
 			},
      {
 				"Id": 9,
 				"Name": "Pig",
 				"Type": 1,
 				"children": null
 			},
      {
 				"Id": 10,
 				"Name": "Dustbin",
 				"Type": 1,
 				"children": null
 			},
      {
 				"Id": 11,
 				"Name": "Traffic barricade",
 				"Type": 1,
 				"children": null
 			}]
 		}]
 	}
 ]
''');
