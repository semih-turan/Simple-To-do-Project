// importlar
import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat"; // Web assemnble ile byte a ceviriyor.
import Iter "mo:base/Iter";
import Text "mo:base/Text";

// smart contract -> canister (icp) 

actor Assistant { // akilli sozlesmeyi baslatir

  type ToDo = {
    description: Text;
    completed: Bool;
  };

  // basit data turleri
  // text -> string
  // bool -> true, false
  // Nat -> natural number (integer)

  // Fonksiyonlar
  func natHash(n: Nat)  : Hash.Hash{
    Text.hash(Nat.toText(n)) // return ...;
  };

  // Degiskenler
  // let -> immutable
  // var -> mutable
  // const -> global

  var todos = Map.HashMap<Nat, ToDo>(0, Nat.equal, natHash);
  var nextId : Nat = 0;
  
  // func ->  private 
  // public query func -> sorgulama
  // punlic fun -> update

  public query func getTodos() : async [ToDo] {
    Iter.toArray(todos.vals());
  };

  public func addTodo(description: Text) : async Nat {
    let id = nextId;
    todos.put(id, {description = description; completed = false});
    nextId += 1;
    id  // return id;
  };
 
  public func completeTodo(id: Nat) : async (){
    ignore do ? {
      let description = todos.get(id)!.description;
      todos.put(id,{description; completed = true});
    }
  };

  public query func showTodos() : async Text {
    var output: Text = "\n_____TO-DOs______";
    for (todo: ToDo in todos.vals()) {
      output #= "\n" # todo.description;
      if (todo.completed){ output #=" !";};
    };
    output # "\n"
  };
  
  public func clearCompleted() : async () {
    todos := Map.mapFilter<Nat, ToDo, ToDo>(todos, Nat.equal, natHash,
      func(_, todo) {if (todo.completed) null else ?todo});
  };

}
