package main

import (
  "fmt"
  "regexp"
  "io/ioutil"
  "io"
  "os"
)

//error checking function
func check(e error) {
  if e != nil{
    panic(e)
  }
}

//function to open file and read the contents and get file name for wrtie file
func read() (string, []byte) {
  //gets input file and output file name by command line argumement and stores
  //each argument in seperate variables
  inputFile := os.Args[1]
  outputFile := os.Args[2]

  fmt.Println("\nReading input file...")

  //open file based on user input
  data, err := ioutil.ReadFile(inputFile)
  check(err)

  return outputFile, data
}

//function to parse out all numbers in the file
func parse(input []byte) string {
  //convert byte array to string of entire input file
  myString := string(input[:])

  //use regex to find all integers in the string
  pattern := regexp.MustCompile("[0-9]+")

  //returns an array of type []string
  noNumbers := pattern.ReplaceAllString(myString,"")

  return noNumbers
}

//function to write the new data with only the numbers
func write(data string, fileName string) {
  //create file message
  fmt.Printf("\nCreating output file with name '%s'...\n\n", fileName)

  //create file using given filename
  file, createErr := os.Create(fileName)
  check(createErr)

  defer file.Close()

  //write data to newly created file
  _, writeErr:= io.WriteString(file, data)
  check(writeErr)

  //isssue a sync to flush writes to stable storage
  file.Sync()
}


//main
func main() {
  //call read(), put file name and file contents into variables
  fileName, readData := read()
  //call parse(), read in entire file and parse numbers from file
  parsedData := parse(readData)
  //give string from input file minus parsed out numbers and output file name,
  //write contents to created output file with given name
  write(parsedData, fileName)
}
