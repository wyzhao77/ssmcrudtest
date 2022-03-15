package com.zwy.bean;

import java.util.HashMap;
import java.util.Map;

public class Message {
    private int code;
    private String msg;
    private Map<String,Object> extent = new HashMap<String,Object>();
    public static Message sucess(){
        Message result = new Message();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }
    public static Message fail(){
        Message result = new Message();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }
    public Message add(String key,Object value){
        this.getExtent().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtent() {
        return extent;
    }

    public void setExtent(Map<String, Object> extent) {
        this.extent = extent;
    }
}
