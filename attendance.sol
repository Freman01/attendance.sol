// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ClassRegister {
    struct StudentData {
        uint256 serialNo;
        string studentName;
        string houseAddress;
        string courseName;
        uint256 matricNumber;
    }

    struct TeacherData {
        string name;
        string courseTaken;
        uint256 timeSchedule;
        uint256 phoneNumber;
    }

    // Mapping to store student details using their matric number
    mapping(uint256 => StudentData) public students;

    // Mapping to store teacher details using their phone number
    mapping(uint256 => TeacherData) public teachers;

    // Event to log new student registration
    event NewStudentRegistration(
        uint256 matricNo,
        string name,
        string course,
        string houseAddress
    );

    // Event to log teacher sign-in
    event TeacherSignedIn(
        string name,
        string courseTaken,
        uint256 timeSchedule,
        uint256 phoneNumber
    );

    // Counter to generate unique serial numbers
    uint256 public serialNumber;

    // Function to fill the student register
    function fillRegister(
        string memory stuName,
        string memory houseAddress,
        string memory course,
        uint256 matric
    ) public {
        StudentData memory newStudent = StudentData({
            serialNo: serialNumber,
            studentName: stuName,
            houseAddress: houseAddress,
            courseName: course,
            matricNumber: matric
        });

        students[matric] = newStudent;

        emit NewStudentRegistration(matric, stuName, course, houseAddress);

        serialNumber++;
    }

    // Optional: Function to register a teacher
    function signInTeacher(
        string memory name,
        string memory courseTaken,
        uint256 timeSchedule,
        uint256 phoneNumber
    ) public {
        TeacherData memory newTeacher = TeacherData({
            name: name,
            courseTaken: courseTaken,
            timeSchedule: timeSchedule,
            phoneNumber: phoneNumber
        });

        teachers[phoneNumber] = newTeacher;

        emit TeacherSignedIn(name, courseTaken, timeSchedule, phoneNumber);
    }
}
