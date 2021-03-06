// Signature file for parser generated by fsyacc
module TheParser
type token = 
  | IS
  | DISPLAY
  | ACCEPT
  | STOP
  | IF
  | END_IF
  | PROCEDURE
  | DATA
  | WORKING_STORAGE
  | IDENTIFICATION
  | PROGRAM_ID
  | AUTHOR
  | EOF
  | LITERAL of (string)
  | SLOT of (string)
  | ID of (string)
  | NUMBER of (int)
type tokenId = 
    | TOKEN_IS
    | TOKEN_DISPLAY
    | TOKEN_ACCEPT
    | TOKEN_STOP
    | TOKEN_IF
    | TOKEN_END_IF
    | TOKEN_PROCEDURE
    | TOKEN_DATA
    | TOKEN_WORKING_STORAGE
    | TOKEN_IDENTIFICATION
    | TOKEN_PROGRAM_ID
    | TOKEN_AUTHOR
    | TOKEN_EOF
    | TOKEN_LITERAL
    | TOKEN_SLOT
    | TOKEN_ID
    | TOKEN_NUMBER
    | TOKEN_end_of_input
    | TOKEN_error
type nonTerminalId = 
    | NONTERM__startstart
    | NONTERM_start
    | NONTERM_identification
    | NONTERM_data
    | NONTERM_sections
    | NONTERM_slotDeclarations
    | NONTERM_slot
    | NONTERM_procedures
    | NONTERM_statements
    | NONTERM_op
    | NONTERM_condition
    | NONTERM_command
/// This function maps tokens to integer indexes
val tagOfToken: token -> int

/// This function maps integer indexes to symbolic token ids
val tokenTagToTokenId: int -> tokenId

/// This function maps production indexes returned in syntax errors to strings representing the non terminal that would be produced by that production
val prodIdxToNonTerminal: int -> nonTerminalId

/// This function gets the name of a token as a string
val token_to_string: token -> string
val start : (Microsoft.FSharp.Text.Lexing.LexBuffer<'cty> -> token) -> Microsoft.FSharp.Text.Lexing.LexBuffer<'cty> -> (cobolSourceProgram) 
