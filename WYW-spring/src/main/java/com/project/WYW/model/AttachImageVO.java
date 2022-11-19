package com.project.WYW.model;

public class AttachImageVO {

    private String upload_path;

    private String uuid;

    private String file_name;

    private int product_id;

    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "AttachImageVO{" +
                "upload_path='" + upload_path + '\'' +
                ", uuid='" + uuid + '\'' +
                ", file_name='" + file_name + '\'' +
                ", product_id=" + product_id +
                '}';
    }
}
