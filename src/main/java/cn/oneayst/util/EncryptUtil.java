package cn.oneayst.util;

import cn.oneayst.model.UserModel;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;

public class EncryptUtil {
    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    public static void main(String[] args) {
    }

    public void encryptPassword(UserModel user) {
        String salt = randomNumberGenerator.nextBytes().toHex();
        user.setCredentialsSalt(salt);
//        String newPassword = new SimpleHash("md5", user.getPassword(), ByteSource.Util.bytes(user.getAccount() + salt), 2).toHex();
        String newPassword = md5Encrypt(user.getPassword(), user.getAccount() + salt);
        user.setPassword(newPassword);
    }

    public String md5Encrypt(String originStr, String salt) {
        return new SimpleHash("md5", originStr, salt, 2).toHex();
    }
}
