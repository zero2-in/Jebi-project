package com.jebi.common;

import com.oreilly.servlet.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface MultipartCommand {
    public void execute(MultipartRequest mpr, HttpServletRequest request, HttpServletResponse response) throws IOException;
}
