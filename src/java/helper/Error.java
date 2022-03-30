/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.io.Serializable;

/**
 *
 * @author Lim
 */
public class Error implements Serializable {

    private boolean isError;
    private boolean emailRedundant;
    private boolean emailEmpty;
    private boolean fullNameEmpty;
    private boolean phoneNoRedundant;
    private boolean phoneNoEmpty;
    private boolean passwordNotFollowRequirement;
    private boolean passwordNotSame;
    private boolean vCodeNotMatch;
    private boolean dobFormatErr;
    private boolean vCodeExpire;
    private boolean emailNotFound;
    private boolean emailPasswordNotMatch;

    public Error() {
    }

    public boolean isIsError() {
        return isError;
    }

    public void setIsError(boolean isError) {
        this.isError = isError;
    }

    public boolean isEmailRedundant() {
        return emailRedundant;
    }

    public void setEmailRedundant(boolean emailRedundant) {
        this.emailRedundant = emailRedundant;
    }

    public boolean isEmailEmpty() {
        return emailEmpty;
    }

    public void setEmailEmpty(boolean emailEmpty) {
        this.emailEmpty = emailEmpty;
    }

    public boolean isFullNameEmpty() {
        return fullNameEmpty;
    }

    public void setFullNameEmpty(boolean fullNameEmpty) {
        this.fullNameEmpty = fullNameEmpty;
    }

    public boolean isPhoneNoRedundant() {
        return phoneNoRedundant;
    }

    public void setPhoneNoRedundant(boolean phoneNoRedundant) {
        this.phoneNoRedundant = phoneNoRedundant;
    }

    public boolean isPhoneNoEmpty() {
        return phoneNoEmpty;
    }

    public void setPhoneNoEmpty(boolean phoneNoEmpty) {
        this.phoneNoEmpty = phoneNoEmpty;
    }

    public boolean isPasswordNotFollowRequirement() {
        return passwordNotFollowRequirement;
    }

    public void setPasswordNotFollowRequirement(boolean passwordNotFollowRequirement) {
        this.passwordNotFollowRequirement = passwordNotFollowRequirement;
    }

    public boolean isPasswordNotSame() {
        return passwordNotSame;
    }

    public void setPasswordNotSame(boolean passwordNotSame) {
        this.passwordNotSame = passwordNotSame;
    }

    public boolean isvCodeNotMatch() {
        return vCodeNotMatch;
    }

    public void setvCodeNotMatch(boolean vCodeNotMatch) {
        this.vCodeNotMatch = vCodeNotMatch;
    }

    public boolean isDobFormatErr() {
        return dobFormatErr;
    }

    public void setDobFormatErr(boolean dobFormatErr) {
        this.dobFormatErr = dobFormatErr;
    }

    public boolean isvCodeExpire() {
        return vCodeExpire;
    }

    public void setvCodeExpire(boolean vCodeExpire) {
        this.vCodeExpire = vCodeExpire;
    }

    public boolean isEmailNotFound() {
        return emailNotFound;
    }

    public void setEmailNotFound(boolean emailNotFound) {
        this.emailNotFound = emailNotFound;
    }

    public boolean isEmailPasswordNotMatch() {
        return emailPasswordNotMatch;
    }

    public void setEmailPasswordNotMatch(boolean emailPasswordNotMatch) {
        this.emailPasswordNotMatch = emailPasswordNotMatch;
    }

}
