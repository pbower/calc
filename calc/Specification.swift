//
//  Specification.swift
//  calc
//
//  Created by Peter Bower on 15/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

/*Prog Guide
 SPECIFICATION
 Mac OS Cmd Line Tool -> Simple Calculator
 Contraints:
 1. Only work with Integers
 2. Only work with + - x / %(modulus)
 
 HINTS:
 1. The arguments are a REPEATED sequence in the form
 [<number> <operator>] ending in <operator>]
 2. For order of evaluation, use MULTIPLE steps.
 a) For example, 2 + 4 x 3 - 6 BECOMES 2 + 12 - 6
 to implement ORDER OF EVALUATION
 b) Then, it becomes 14 - 6 to implement LEFT TO RIGHT EVALUATION
 and so forth
 Another example 4 x 5 % 2 becomes 20 % 2 (and then 0).
 3. Get it working with + and - first, i.e. L2R evaluation before OOEval
 4. Solve it using Recursion (rather than iteration).
 Particularly for multiplication, division etc.
 
 FEATURES / RULES:
 Functionality:
 1. Hitting enter will cause program to evaluate the arguments and print result
 2. x, / and % must be evaluated before + and -
 3. Operators must be evaluated left to right
 4. As we are using integers, floats rounding to integers is ok.
 5. Must be able to use unary operators e.g. +5 or -5
 input: ./calc -5 / +2
 output: -2
 6. Must check to ensure cmd line arguments are valid and if not:
 a) generate an appropriate error msg
 b) terminate with non-zero exit status
 7. Must check for
 a) division by 0 errors
 b) numeric out-of-bounds erros
 Note: check example prog implementation and mirror it
 8. Must use class structures to model the problem domain
 9. Must work EXACTLY the same as reference/calc
 10. Prints results using std. output (otherwise it won't get picked up by tester)
 11. Prints additional messages to std. error
 Style:
 12. Indentation, whitespace and braces
 13. Good use of comments
 14. Clear symbol naming
 Design:
 
 
 F&R - MARKING CRITERIA
 12. Functionality:
 Xcode project must unzip successfully and compile without errors
 Penalty :
 3 marks if any compiler warnings
 1 mark per failing test via CalcTest
 13.Style:
 Penalty :
 1 mark for bad or inconsistent indentation, whitespace, or braces
 1 mark for bad or misleading comments.
 1 mark for unclear symbol naming.
 13. Design:
 Awarded :
 1 Functional separation:    Is the problem broken down into meaningful parts?
 1 Loose coupling:           Can parts be changed in isolation of each other?
 1 Extensibility:            Would it be easy to add more functionality? (more operations, more numerical accuracy, interactivity, variables, etc)
 1 Control flow:             Are all actions of the same type handled at the same level?
 1 Error handling:           Are errors detected at appropriate places? Can they be collected somewhere central
 1 Marker's discretion:      can be awarded for anything but also +1 for finding an error in error, ambiguity or bug)
 */


