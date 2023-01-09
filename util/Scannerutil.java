package util;

import java.util.Scanner;

// Scanner 클래스를 통해 입력을 받을 시에 도움이 될만한 static 메소드를 모아둔 클래스
public class Scannerutil {
    // 1. 입력시 사용자에게 보여줄 메시지 출력을 담당할 메소드
    public static void printMessage(String message){
        System.out.println(message);
        System.out.print("> ");

    }

    // 2. 스캐너 버그를 미리 방지하는 nextLine()
    public static String nextLine(Scanner scanner, String message){
        printMessage(message);
        String temp = scanner.nextLine();
        if(temp.isEmpty()){
            temp = scanner.nextLine();
        } // 버퍼 메모리 비어있으면
        return temp;
    }

    // 3. 사용자로부터 정수 입력을 담당하는 nextInt()
    public  static int nextInt(Scanner scnner, String message){
        printMessage(message);
        int temp = scnner.nextInt();

        return temp;
    }

    // 4. 사용자로부터 특정 범위의 정수 입력을 담당하는 nextInt()
    // 매개변수가 다르면 메소드 이름은 동일해도 무방
    public static int nextInt(Scanner scanner, String message, int min, int max){
        printMessage(message);
        int temp = nextInt(scanner,message);

        while(temp < min || temp > max){
            System.out.println("잘못 입력하셨습니다.");
            temp = nextInt(scanner, message);
        }

        return temp;
    }
}
