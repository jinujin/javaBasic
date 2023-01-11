package day0111;
// 접근제한자
/*
 public -> 다른 패키지에서도 사용가능
 protected -> 같은 패키지에 있는 외부 클래스들은 문제 없음 / 외부에 있는 패키지에 경우
 상속 관계가 아니면 해당 메소드 필드 사용 불가
 defult -> 같은 패키지에 있는 외부 클래스들만 가능 / => 패키지 접근 제한자 / 아무것도 안써서 표시
 private -> 같은 패키지 안에 있는 내부 클래스에서만 사용 가능
 */
public class Board {
    private int id;
    private String title;

    private String writer;
    private String content;

    public int getId(){
        return id;
    }

    public void setId(int id){
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void printBoard(){
        System.out.println("-----------------------------------");
        System.out.println(title);
        System.out.println("-----------------------------------");
        System.out.println("번호: " + id);
        System.out.println("작성자: " + writer);
        System.out.println("-----------------------------------");
        System.out.println(content);
    }

    public boolean equals(Object o){
        if(o instanceof Board){
            Board b = (Board)o;
            return id == b.id;
        }

        return false;
    }
}
















