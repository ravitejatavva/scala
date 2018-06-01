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


