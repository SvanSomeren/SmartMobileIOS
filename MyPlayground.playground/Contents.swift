//: Playground - noun: a place where people can play :thinking:

import UIKit

enum Profiel
{
    case Software
    case Media
    case Technology
    case Business
}

var room = classRoom()
var room2 = classRoom()

var student1 = Student(name: "Simon", age: 13, route: Profiel.Software)
room.addStudent(student: student1)
var student2 = Student(name: "Tom", age: 12, route: Profiel.Media)
room.addStudent(student: student2)
print("Students in room1")
room.printStudents()
room.moveStudents(room: room2)
print("Students in room1")
room.printStudents()
print("Students in room2")
room2.printStudents()
room2.removeStudent(student: student1)
print("Students in room2")
room2.printStudents()

class Student {
    var name:String
    var age:Int
    var route:Profiel
    
    init(name: String, age: Int, route: Profiel) {
        self.name = name
        self.age = age
        self.route = route
    }
    
    func getName() -> String
    {
        return name
    }
}

class classRoom {
    var students = [Student]()
    
    func addStudent(student: Student)
    {
        students.append(student)
    }
    
    func printStudents()
    {
        if students.isEmpty
        {
            print("No students in this classroom")
        }
        for student in students
        {
            print(student.getName())
        }
    }
    
    func removeStudent(student: Student)
    {
        if let index = students.index(where: {$0 === student})
        {
            students.remove(at: index)
        }
    }
    
    func moveStudents(room: classRoom)
    {
        for Student in students
        {
            room.addStudent(student: Student)
        }
        students.removeAll()
    }
}

