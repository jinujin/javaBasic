package day0110;

/*
 무한루프를 사용하여
 사용자가 입력을 누를 때마다 새로운 학생의 정보가 입력이 되고
 출력을 누를 때마다 맨 마지막으로 입력한 학생의 정보가 출력되는 프로그램을
 작성하시오.
 */

import util.Scannerutil;

import java.util.Scanner;

public class Ex04Gradeboodk02 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Student s = new Student();
        boolean inputSwitch = false;

        while(true){
            String message = "1. 입력 2. 출력 3. 종료";
            int n = Scannerutil.nextInt(scanner,message);
            if(n==1){
                message = "학생 번호";
                insertInfo(scanner, s);
                inputSwitch = true;
            } else if (n==2) {
                if(inputSwitch){
                    printInfo(s);
                }else{
                    System.out.println("입력된 정보 x");
                }

            } else{
                System.out.println("감사합니다.");
                break;
            }
        }

    }

    public static void insertInfo(Scanner scanner, Student s){
        String message;

        message = "학생 번호";
        s.id = Scannerutil.nextInt(scanner,message);

        message = "학생 이름";
        s.name = Scannerutil.nextLine(scanner,message);
    }

    public static void printInfo(Student s){
        System.out.println("----------------------");
        System.out.println("학생 번호 : "+s.id);
        System.out.println("학생 이름 : "+s.name);
        System.out.println("----------------------");
    }



}
