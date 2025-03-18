/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

public class Account {
    private int userID;         // Mã người dùng (tự tăng trong DB)
    private String userName;    // Tên người dùng
    private String password;    // Mật khẩu
    private String email;       // Email
    private String address;     // Địa chỉ
    private String phoneNumber; // Số điện thoại
    private int roleID;         // Vai trò (mặc định là 1 - người dùng bình thường)
    private int status;         // Trạng thái (1: Hoạt động, 0: Bị khóa)
    private int id;
    private String user;
    private String pass;
    private int isSell;
    private int isAdmin;
    private String fullName;
    private String phone;

    // Constructor mặc định
    public Account() {
        this.roleID = 1;  // Mặc định roleID là 1
        this.status = 1;  // Mặc định status là 1
    }

    // Constructor đầy đủ tham số
    public Account(int userID, String userName, String password, String email, 
                   String address, String phoneNumber, int roleID, int status) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.roleID = roleID;
        this.status = status;
    }

    // Getter và Setter cho userID
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Getter và Setter cho userName
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    // Getter và Setter cho password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter và Setter cho email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter và Setter cho address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // Getter và Setter cho phoneNumber
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    // Getter và Setter cho roleID
    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    // Getter và Setter cho status
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    // Add or fix these getter methods:

    public int getId() {
        return userID; // Make sure this returns the userID, not id
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return userName; // Make sure this returns userName, not user
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return password; // Make sure this returns password, not pass
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsSell() {
        return roleID;  // assuming roleID of 2 means seller
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return roleID == 3 ? 1 : 0;  // assuming roleID of 3 means admin
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phoneNumber;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getUserId() {
        return userID; // Return the actual userID instead of throwing an exception
    }   
    // Phương thức toString để in thông tin đối tượng (tuỳ chọn)
    @Override
    public String toString() {
        return "Account{" +
                "userID=" + userID +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", roleID=" + roleID +
                ", status=" + status +
                '}';
    }

    public String getUsername() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}