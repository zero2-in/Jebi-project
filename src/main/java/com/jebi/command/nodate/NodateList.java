package com.jebi.command.nodate;

import com.jebi.common.Command;
import com.jebi.dao.NodateDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class NodateList implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String search = request.getParameter("s");
        if(search == null) search = "";

        NodateDAO dao = new NodateDAO();

        int pageSize = 10; // 한 페이지에 출력할 레코드 수

        // 페이지 링크를 클릭한 번호 / 현재 페이지
        String pageNum = request.getParameter("pageNum");
        if (pageNum == null) { // 클릭한게 없으면 1번 페이지
            pageNum = "1";
        }

        // 연산을 하기 위한 pageNum 형변환 / 현재 페이지
        int currentPage = Integer.parseInt(pageNum);

        // 해당 페이지에서 시작할 레코드 / 마지막 레코드
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;

        int count = dao.getTotal(search);
        int no = count - (pageSize * (currentPage - 1));

        int pageCount = count / pageSize + (count%pageSize==0 ? 0 : 1);
        int pageBlock = 5;
        int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;

        request.setAttribute("list", dao.getNodateList(search, startRow, endRow));
        request.setAttribute("s", search);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("startRow", startRow);
        request.setAttribute("endRow", endRow);
        request.setAttribute("count", count);
        request.setAttribute("no", no);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("pageBlock", pageBlock);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
    }
}
