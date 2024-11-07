/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CE181767 - Le Nhut Anh
 */
public class Encryption {
    public static String encryptMD5(String text) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.reset();
            md.update(text.getBytes());
            byte[] bytes = md.digest();
            BigInteger number = new BigInteger(1, bytes);
            String hashText = number.toString(16);
            while (hashText.length() < 32) {
                hashText = "0" + hashText;
            }
            return hashText;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean equalsMD5(String text, String encryptedText) {
        String hashText = encryptMD5(text);
        return hashText.equalsIgnoreCase(encryptedText);
    }
    
    public static String encryptSHA256(String text) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.reset();
            md.update(text.getBytes());
            byte[] bytes = md.digest();
            BigInteger number = new BigInteger(1, bytes);
            String hashText = number.toString(16);
            while (hashText.length() < 64) {
                hashText = "0" + hashText;
            }
            return hashText;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean equalsSHA256(String text, String encryptedText) {
        String hashText = encryptSHA256(text);
        return hashText.equalsIgnoreCase(encryptedText);
    }
}
