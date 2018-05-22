Scala classes are all subclasses of java.lang.Object
Scala has a grand supertype called Any, under which there are two types, AnyVal and AnyRef.
AnyVal is the supertype of all value types, which AnyRef is the supertype of all “reference types” or classes. 
All Scala and Java classes are subtypes of AnyRef.
There are two special types at the bottom of the hierarchy. Nothing is the type of throw expressions, and Null is the type of the value null. These special types are subtypes of everything else, 
which helps us assign types to throw and null while keeping other types in our code same.
