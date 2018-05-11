package com.king.enums;
      

public enum RespCode {

	RESP_CODE_SUCCESS("0", "成功"),
	RESP_CODE_FAILER("1", "失败"),
	ONE_COUNT_TYPE_ERROR("10000","该类型只能添加一条数据!"),
	ONE_COUNT_ERROR("10001","只能添加一条数据!");

	
	private final String code;
	private final String desc;

	private
	RespCode(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public String getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}

	public static RespCode get(String code) {
		for (RespCode constants : RespCode.values()) {
			if (constants.getCode().equals(code))
				return constants;
		}
		throw new IllegalArgumentException("RespCode is not exist : "+ code);
	}
}
  