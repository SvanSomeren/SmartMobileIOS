//: Playground - noun: a place where people can play :thinking:

import UIKit

var room = classRoom()
var room2 = classRoom()

var student1 = Student(name: "Simon", age: 13)
room.addStudent(student: student1)
var student2 = Student(name: "Tom", age: 12)
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
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
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
