package com.project.WYW.dto;

public class FindPwdDto {

    private String password;
    private int certification;
    private String resultMsg;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCertification() {
        return certification;
    }

    public void setCertification(int certification) {
        this.certification = certification;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    @Override
    public String toString() {
        return "FindPwdDto{" +
                "password='" + password + '\'' +
                ", certification=" + certification +
                ", resultMsg='" + resultMsg + '\'' +
                '}';
    }
}
