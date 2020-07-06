package com.arjjs.ccm.tool;

import com.arjjs.ccm.common.utils.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HtmlUtil {
    private static final String[] HEADERS = {
            "X-Forwarded-For",
            "Proxy-Client-IP",
            "WL-Proxy-Client-IP",
            "HTTP_X_FORWARDED_FOR",
            "HTTP_X_FORWARDED",
            "HTTP_X_CLUSTER_CLIENT_IP",
            "HTTP_CLIENT_IP",
            "HTTP_FORWARDED_FOR",
            "HTTP_FORWARDED",
            "HTTP_VIA",
            "REMOTE_ADDR",
            "X-Real-IP"
    };

    public static List<String> getImgStr(String htmlStr) {
        List<String> list = new ArrayList<>();
        String img = "";
        Pattern p_image;
        Matcher m_image;
        // String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
        p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(htmlStr);
        while (m_image.find()) {
            // 得到<img />数据
            img = m_image.group();
            // 匹配<img>中的src数据
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
            while (m.find()) {
                list.add(m.group(1));
            }
        }
        return list;
    }


    public static String getUrlAndPort1(String Str) {
        //切分
        String regex = "/";
        String[] strings = Str.split(regex);
        //输出结果
        System.out.println(strings[2]);
        return strings[2];
    }

    public static String getStr(String Str) {
        String newStr = Str.replace("http://", "");
        String string = newStr.substring(newStr.indexOf("/"),newStr.length());
        System.out.println(string);
        return string;
    }


    public static String getUrlAndPort3(String Str) {
        Pattern pattern = Pattern.compile("[^http://]*?.com");
        Matcher matcher = pattern.matcher(Str);
        while(matcher.find()){
            String group = matcher.group();
            System.out.println(group);
        }
        return null;
    }
    public static String getIpAddress(HttpServletRequest request) {
        String ip = "";
        for (String header : HEADERS) {
            ip = request.getHeader(header);
            if(StringUtils.isNotEmpty(ip)) {
                break;
            }
        }
        if(StringUtils.isEmpty(ip)){
            ip = request.getRemoteAddr();
        }
        if(StringUtils.isNotEmpty(ip) && ip.contains(",")){
            ip = ip.split(",")[0];
        }
        if("0:0:0:0:0:0:0:1".equals(ip)){
            ip = "127.0.0.1";
        }
        return ip;
    }
    public static String getMappingUrl(String configUrl, String addressUrl) {
        String newUrl ="0.0.0.0";
        try {
            URL url = new URL(addressUrl);
            newUrl = "http://" + configUrl+ url.getPath();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newUrl;
    }
    public static String getActualConfigUrl(String addressUrl) {
        String configUrl ="";
        try {
            URL url = new URL(addressUrl);
            configUrl = url.getAuthority();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return configUrl;
    }
}
