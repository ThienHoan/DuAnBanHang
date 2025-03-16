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
}