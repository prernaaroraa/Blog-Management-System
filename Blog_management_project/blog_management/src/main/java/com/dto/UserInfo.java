package com.dto;

public class UserInfo
{
private String username;
private String password;
private String email;
private String firstname;
private int uniqueid;
public int getUniqueid() {
	return uniqueid;
}
public void setUniqueid(int uniqueid) {
	this.uniqueid = uniqueid;
}
public String getFirstname() {
	return firstname;
}
public void setFirstname(String firstname) {
	this.firstname = firstname;
}
public String getLastname() {
	return lastname;
}
public void setLastname(String lastname) {
	this.lastname = lastname;
}
public String getContactno() {
	return contactno;
}
public void setContactno(String contactno) {
	this.contactno = contactno;
}
private String lastname;
private String contactno;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}