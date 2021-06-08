import org.junit.jupiter.api.Test;

import java.util.Arrays;


public class Lambda {

    @Test
    public void to() {
        String[] array = new String[]{"apple", "iphone", "IPad", "Mac"};
        Arrays.sort(array, (s1, s2) -> {
            return s1.compareTo(s2);
        });
//        Arrays.sort(array, String::compareTo);
        System.out.println(String.join(",", array));
    }

    @Test
    public void Th() {
        new Thread(
                () -> {
                    System.out.println("This Thread");
                }
        ).start();
        new Thread(
                () -> {
                    to();
                }
        ).start();
        Runnable runnable = () -> this.to();
        {
            System.out.println();
        }
        ;
        runnable.run();

    }
}
