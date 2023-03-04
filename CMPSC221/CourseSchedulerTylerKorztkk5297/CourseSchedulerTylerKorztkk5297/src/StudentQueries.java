/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Freez
 */
public class StudentQueries {
    private static Connection connection;
    private static PreparedStatement addStudent;
    private static PreparedStatement getAllStudents;
    private static ResultSet resultSet;
    
    public static void addStudent(StudentEntry student){
        connection = DBConnection.getConnection();

        try
        {
            addStudent = connection.prepareStatement("insert into app.student (STUDENTID, FIRSTNAME, LASTNAME) values (?, ?, ?)");
            addStudent.setString(1, student.getStudentID());
            addStudent.setString(2, student.getFirstName());
            addStudent.setString(3, student.getLastName());
            addStudent.executeUpdate();
        }
        catch(SQLException sqlException){
            sqlException.printStackTrace();
        }
    }
    
    public static ArrayList<StudentEntry> getAllStudents(){
        connection = DBConnection.getConnection();
        ArrayList<StudentEntry> studentList = new ArrayList<>();
        
        try{
            getAllStudents = connection.prepareStatement("select * from app.student");
            resultSet = getAllStudents.executeQuery();
            
            while(resultSet.next()){
                String studentID = resultSet.getString(1);
                String firstName = resultSet.getString(2);
                String lastName = resultSet.getString(3);
                
                StudentEntry student = new StudentEntry(studentID, firstName, lastName);
                studentList.add(student);
            }
        }
        catch(SQLException sqlException){
            sqlException.printStackTrace();
        }
        return studentList;
    }    
}
