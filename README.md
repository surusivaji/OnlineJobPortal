# 📌 Online Job Portal

### 🛠️ Technologies Used:
- ![Java](https://img.shields.io/badge/Java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white) **Java**
- ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) **Spring Boot**
- ![Spring MVC](https://img.shields.io/badge/Spring%20MVC-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) **Spring MVC**
- ![JSP](https://img.shields.io/badge/JSP-%23F7DF1E.svg?style=for-the-badge&logo=java&logoColor=black) **JSP**
- ![MySQL](https://img.shields.io/badge/MySQL-%234479A1.svg?style=for-the-badge&logo=mysql&logoColor=white) **MySQL**
- ![Bootstrap](https://img.shields.io/badge/Bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white) **Bootstrap**
- ![Spring Data JPA](https://img.shields.io/badge/Spring%20Data%20JPA-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) **Spring Data JPA**

## 📄 Project Overview:
The **Online Job Portal** is a web-based application that allows administrators to manage job listings and users to browse and apply for jobs. This application follows an MVC architecture and is built using modern web technologies for efficient performance and scalability.

## 🏛️ Project Architecture:
The project is segregated into **4 layers**:

1. **Controller Layer** 🖥️  
   - Handles HTTP requests and responses.

2. **Repository Layer** 💾  
   - Contains interfaces for performing database operations.

3. **Service Layer** ⚙️  
   - Implements business logic.

4. **Model Layer** 📂  
   - Contains entity classes representing tables such as `admin`, `user`, and `jobs`.

## 🌟 Features & Functionalities:

### 👤 Admin Features:
1. **Add Jobs** - The admin can create and post new job listings by entering job details such as title, description, salary, and required skills.
2. **View Jobs** - The admin can see all the jobs listed in the system along with relevant details.
3. **Remove Jobs** - The admin has the ability to delete jobs that are no longer available or relevant.
4. **Edit Jobs** - The admin can update existing job listings by modifying details as needed.
5. **View Admin Profile** - The admin can view their personal details such as name, email, and contact information.
6. **Edit Admin Profile** - The admin can update their profile information, such as changing passwords or updating personal details.

### 👨‍💼 User Features:
1. **User Registration** - New users can sign up by providing necessary details such as name, email, phone number, and password. The data is securely stored in the database.
2. **User Login** - Registered users can log in using their credentials to access job listings and manage their profiles.
3. **Password Reset** - If a user forgets their password, they can reset it using their registered email and mobile number.
4. **View Jobs** - Users can browse available job listings and see details such as job descriptions, salary, and required qualifications.
5. **View User Profile** - Users can see their personal details, including their resume, contact details, and saved job applications.
6. **Edit User Profile** - Users can update their details, such as modifying personal information or uploading a new resume.

## 🚀 Installation & Setup:
### Prerequisites:
- Java 8 or later
- MySQL Database
- Spring Boot
- Maven

### Steps to Run the Project:
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/online-job-portal.git
   ```
2. Navigate to the project directory:
   ```bash
   cd online-job-portal
   ```
3. Configure the MySQL database in `application.properties`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/jobportal
   spring.datasource.username=root
   spring.datasource.password=yourpassword
   ```
4. Build and run the project:
   ```bash
   mvn spring-boot:run
   ```
5. Access the application at:
   ```
   http://localhost:8080
   ```

## 📷 Screenshots:
### 🔹 Home Page:
![Home Page](index.png)

### 🔹 Registration Page:
![Registration Page](register.png)

### 🔹 Login Page:
![Login Page](login.png)

### 🔹 Forgot Password Page:
![Forgot Password Page](forgotpassword.png)

### 🔹 Change Password Page:
![Change Password Page](changePassword.png)

### 🔹 Admin Login Page:
![Admin Login](adminlogin.png)

### 🔹 Admin Home Page:
![Admin Home](adminhome.png)

### 🔹 Admin Profile Page:
![Admin Profile](adminprofile.png)

### 🔹 Edit Admin Page:
![Edit Admin](editadminprofile.png)

### 🔹 Add Job Page:
![Add Job Page](addjob.png)

### 🔹 View Jobs Page:
![View Jobs Page](ViewJobs.png)

### 🔹 Edit Job Page:
![Edit Job Page](editjob.png)

### 🔹 Delete Job Page:
![Delete Job Page](deleteJob.png)

### 🔹 Admin Logout Page:
![Admin Logout Page](adminlogout.png)

### 🔹 User Home Page:
![User Home Page](userhome.png)

### 🔹 View Profile Page:
![Profile Page](viewProfile.png)

### 🔹 Edit Profile Page:
![edit profile Page](editprofile.png)

### 🔹 All Jobs Page:
![View Jobs Page](allJobs.png)

### 🔹 Search Job Page:
![Search Job Page](searchJobs.png)

### 🔹 View Job Page:
![View Job Page)](ViewJob.png)

### 🔹 User Logout Page:
![User Logout Page](userlogout.png)

## 🤝 Contributing:
Feel free to raise issues or submit pull requests.

## 📜 License:
This project is **open-source** and free to use.

---
📌 Developed by **Your Name** 👨‍💻

