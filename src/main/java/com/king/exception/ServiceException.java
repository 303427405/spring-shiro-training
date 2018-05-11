/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.king.exception;

import com.king.enums.RespCode;

/**
 * Service层公用的Exception.
 * <p/>
 * 继承自RuntimeException, 从由Spring管理事务的函数中抛出时会触发事务回滚.
 *
 * @author calvin
 */
public class ServiceException extends RuntimeException {

    private static final long serialVersionUID = 8087751174148354521L;
    /**
     * 响应码
     */
    protected RespCode errorCode;
    /**
     * 响应描述
     */
    protected String errorMsg;

    public ServiceException() {
        super();
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public ServiceException(RespCode errorCode) {
        this.errorCode = errorCode;
    }
    public ServiceException(String message) {
        this.errorMsg = message;
    }

    public ServiceException(RespCode errorCode , String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public RespCode getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }
}
