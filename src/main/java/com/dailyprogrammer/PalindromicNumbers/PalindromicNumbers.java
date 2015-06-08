package com.dailyprogrammer.PalindromicNumbers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PalindromicNumbers extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/plain");
        String num = req.getParameter("num");
        if (num != null && !num.equals("")){
            PalindromicNumberChecker pnc = new PalindromicNumberChecker();
            long steps = pnc.getStepCount(num);
            String pal = pnc.getPalindromeNum().toString();
            ArrayList<String> data = new ArrayList<>();
            data.add(String.valueOf(steps));
            data.add(pal);

            String json = toJSON(data);
            resp.getWriter().println(json);
        }
        else {
            resp.getWriter().println("");
        }
    }

    /**
     * I do not want to import a whole libary just to convert something to json
     * @param  pattern the digits that make up the pattern
     * @return         the json string representation of the arraylist
     */
    private static String toJSON(ArrayList<String> pattern){
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < pattern.size(); i++){
            sb.append(pattern.get(i));
            if (i < pattern.size()-1){
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}