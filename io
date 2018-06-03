Scala classes are all subclasses of java.lang.Object
Scala has a grand supertype called Any, under which there are two types, AnyVal and AnyRef.
AnyVal is the supertype of all value types, which AnyRef is the supertype of all “reference types” or classes. 
All Scala and Java classes are subtypes of AnyRef.
There are two special types at the bottom of the hierarchy. Nothing is the type of throw expressions, and Null is the type of the value null. These special types are subtypes of everything else, 
which helps us assign types to throw and null while keeping other types in our code same.

<<ADT structural recursion >>
sealed trait IntList
case object End extends IntList
case class Pair(hd: Int,tl: IntList) extends IntList

def sum(list:IntList) : Int = {
  list match {
    case End => 0
    case Pair(hd,tl) => hd + sum(tl)
  }
}

//val lst: IntList = IntList(1,2,3,4,5)
val example = Pair(1, Pair(2, Pair(3, End)))
println(sum(example))

************************************************************************
sealed trait Tree
case object Leaf(elt:Int) extends Tree
case class Node(val l: Tree, val r: Tree) extends Tree

object TreeOps {
  def sum(tree: Tree) : Int = {
    tree match {
      case Leaf(_) => elt
      case Node(l,r) => sum(l) + sum(r)      
    }
  }
  def product(tree: Tree):  Int = {
    tree match {
      case Leaf(_) => elt
      case Node(l,r) => product(l) + product(r)
    }
  }
  def Double(tree: Tree) : Tree = {
    tree match {
      case Leaf(_) => elt *2
      case Node(l,r) => Node(Double(l) + Double(r)) 
    }
  }
}

******************************************************************************************************
/*final case class Box[A](value: A)
println(Box(2).value)
println(Box("hi").value)

def generic[A](in: A) : A = in

println(generic("hey Boss"))
println(generic(1))

sealed trait LinkedList[A] {
  def length: Int = 
    this match {
      case End() => 0
      case Pair(head,tail) => 1 + tail.length
    }
  def contains(item: A): Boolean = 
    this match {
      case End() => false
      case Pair(head,tail) => 
        if(head == item)
          true
        else
        tail.contains(item)
    }
  def apply(index: Int): A = 
    this match {
      case Pair(head,tail) => 
        if (index ==0)
          head
        else 
          tail(index-1)
      case End() => 
        throw new Exception("Attempted to  get element from empty list")
    }
}
final case class End[A]() extends LinkedList[A]
final case class Pair[A](head: A, tail: LinkedList[A]) extends LinkedList[A]

val  example =  Pair(1, Pair(2, Pair(3, End())))
println(example.length)
println(example.contains(1))
println(example(1))

sealed trait Result[A]
final case class Success[A](result: A) extends Result[A]
final case class Failure[A](reason: String) extends Result[A]

sealed trait LinkedList[A] {
  def apply(index: Int): A = 
    this match {
      case Pair(head,tail) =>
        if (index ==0)
          Success(head)
        else 
          tail(index-1)
      case End() =>
        throw new Exception("index out of Bounds")
    }
}

val sayHi = () => "Hi"
println(sayHi())
*/
case class Pair[A,B](one: A, two: B)
val pair =  Pair("hi",1)
println(pair.one,pair.two)

