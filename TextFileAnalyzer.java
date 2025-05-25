package Task;
import java.io.*;
import java.util.Scanner;
public class TextFileAnalyzer {
	
	public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter file path (e.g., example.txt): ");
        String filePath = scanner.nextLine();

        int lineCount = 0;
        int wordCount = 0;
        int charCount = 0;

        try {
            File file = new File(filePath);
            Scanner fileScanner = new Scanner(file);

            System.out.print("Enter a word to search for: ");
            String searchWord = scanner.nextLine().toLowerCase();
            int searchWordCount = 0;

            while (fileScanner.hasNextLine()) {
                String line = fileScanner.nextLine();
                lineCount++;
                charCount += line.length();

                String[] words = line.split("\\s+");
                wordCount += words.length;

                for (String word : words) {
                    if (word.equalsIgnoreCase(searchWord)) {
                        searchWordCount++;
                    }
                }
            }

            fileScanner.close();

            // Display analysis results
            System.out.println("\n--- File Analysis ---");
            System.out.println("Lines: " + lineCount);
            System.out.println("Words: " + wordCount);
            System.out.println("Characters: " + charCount);
            System.out.println("Occurrences of \"" + searchWord + "\": " + searchWordCount);

        } catch (FileNotFoundException e) {
            System.out.println("Error: File not found. Please check the path and try again.");
        } catch (Exception e) {
            System.out.println("An error occurred: " + e.getMessage());
        }

        scanner.close();
    }

	
}
