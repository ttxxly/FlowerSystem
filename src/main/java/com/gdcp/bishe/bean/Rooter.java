package com.gdcp.bishe.bean;

public class Rooter {
    private int rooterId;

    private String rooterName;

    private String rooterPassword;

    public int getRooterId() {
        return rooterId;
    }

    public void setRooterId(int rooterId) {
        this.rooterId = rooterId;
    }

    public String getRooterName() {
        return rooterName;
    }

    public void setRooterName(String rooterName) {
        this.rooterName = rooterName == null ? null : rooterName.trim();
    }

    public String getRooterPassword() {
        return rooterPassword;
    }

    public void setRooterPassword(String rooterPassword) {
        this.rooterPassword = rooterPassword == null ? null : rooterPassword.trim();
    }
}