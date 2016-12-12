;==========================================================
; Projet Bubble sort                                      |
; Team Alphanumeric                                       |
; Members                                                 |
; 1.SHAMIM HASAN      (151-15-4965)                       |
; 2.SRABANI GAIN      (151-15-4848)                       |
; 3.SM HBIBULLAH NAYEF(151-15-4932                        |
;==========================================================

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB '=====================================' ,,0dh,0ah
     DB '|  _____           _           _    |' ,,0dh,0ah
     DB '| |  __ \         (_)         | |   |' ,,0dh,0ah
     DB '| | |__) | __ ___  _  ___  ___| |_  |' ,,0dh,0ah
     DB '| |  ___/ |__/ _ \| |/ _ \/ __| __| |' ,,0dh,0ah
     DB '| | |   | | | (_) | |  __/ (__| |_  |' ,,0dh,0ah
     DB '| |_|   |_|  \___/| |\___|\___|\__| |' ,,0dh,0ah
     DB '|                _/ |               |' ,,0dh,0ah
     DB '|               |__/                |' ,,0dh,0ah
     DB '|-----------------------------------|' ,,0dh,0ah
     DB '|       Bubble Sort Algorithm       |' ,,0dh,0ah
     DB '|                                   |' ,,0dh,0ah
     DB '|              Using                |' ,,0dh,0ah
     DB '|                                   |' ,,0dh,0ah
     DB '|        Assembly Language          |' ,,0dh,0ah
     DB '|                                   |' ,,0dh,0ah
     DB '|        Team Alphanumeric          |' ,,0dh,0ah
     DB '|                                   |' ,,0dh,0ah
     DB '|-----------------------------------|' ,,0dh,0ah
     DB '|           Team Members            |' ,,0dh,0ah
     DB '|-----------------------------------|' ,,0dh,0ah
     DB '|         MD.SHAMIM HASAN           |' ,,0dh,0ah
     DB '|                                   |' ,,0dh,0ah 
     DB '|           SRABANI GAIN            |' ,,0dh,0ah
     DB '|                                   |' ,,0dh,0ah 
     DB '|       SM HABIBULLAH NAYEF         |' ,,0dh,0ah                                             
     DB '=====================================' ,,0dh,0ah
     
     DB ''                                      ,,0dh,0ah                                             

     DB 'Enter elements to sort: $'             ,,0dh,0ah
       
MSG2 DB  'After Sorting: $'

ARR DB 100 dup (0)  


.CODE 

    MAIN PROC 

        
        MOV AX,@DATA
        MOV DS,AX
     
        
        MOV AH,9
        lea DX,MSG1               ;display mgs1
        INT 21H
    
        MOV CX, 0                 ;clear CX 
        
        
        MOV AH,1
        INT 21H                   ;first input
        MOV SI,0
    WHILE_:

        CMP AL, 0dH               ;compare with enter buttn   
   
        JE EXIT_WHILE             ;jump when enter btn is pressed Enter=0dh   
   
        MOV ARR[SI],AL            ;move input into array
        INC SI                    ;increment si
        INC CX                    ;increment cx 
   
        MOV AH,2
        MOV DL,' '                ;display space
        INT 21h                   
   
        MOV AH,1                  ;for another input
        INT 21H
   
        JMP WHILE_
             
    EXIT_WHILE:
    	MOV AH,2
    	MOV DL,0DH
    	INT 21H
    	MOV DL,0AH
        INT 21H 
    
    
        MOV AH,2
     	MOV DL,0DH
    	INT 21H
    	MOV DL,0AH
        INT 21H 
    
   	    JCXZ EXIT
    	LEA SI,ARR
    	MOV BX,CX
   	
    	CALL BUBBLE_SORT 
  	
    	MOV AH,9
    	LEA DX,MSG2
    	INT 21H
    	XOR SI,SI
	
  	TOP:
    	MOV AH,2
    	MOV DL,ARR[SI]
    	INT 21H
    	MOV DL,' '
    	INT 21H
    	INC SI
    	
    	LOOP TOP
 	
 	EXIT:
 	    MOV AH,4CH
 	    INT  21H 
 	    
 	MAIN ENDP 
    

  BUBBLE_SORT PROC    
    
   ;==========================================================
   ; this procedure will sort the array in ascending order   |
   ; input  : SI=offset address of the array                 |
   ;        : BX=array size                                  |
   ; output : Sorted Array                                   |
   ;==========================================================        
   

        PUSH AX                    ; push AX onto the STACK  
        PUSH BX                    ; push BX onto the STACK
        PUSH CX                    ; push CX onto the STACK
        PUSH DX                    ; push DX onto the STACK
        PUSH DI                    ; push DI onto the STACK

        MOV AX, SI                 ; set AX=SI
        MOV CX, BX                 ; set CX=BX
        DEC CX                     ; dicrement cx 
   
   OUTER_LOOP: 
                
        MOV BX, CX                 ; set BX=CX
        MOV SI, AX                 ; set SI=AX
        MOV DI, AX                 ; set DI=AX
        INC DI                     ; increment di
     
     
   INNER_LOOP:                     ; loop label 
        MOV DL, [SI]               ; set DL=[SI]
        CMP DL, [DI]               ; compare DL with [DI]
        JNG SKIP_EXCHANGE          ; jump to label                       	
        XCHG DL, [DI]              ; set DL=[DI], [DI]=DL
        MOV [SI], DL               ; set [SI]=DL   
        
   SKIP_EXCHANGE:                  ; jump label
       
        INC SI                     ; increment si
        INC DI                     ; increment di
        DEC BX                     ; decrement bx
       
        JNZ INNER_LOOP             ; jump INNER_LOOP if BX!=0 
        
   LOOP OUTER_LOOP                 ; jump OUTER_LOOP while


        POP DI                     ; pop a value from STACK into DI
        POP DX                     ; pop a value from STACK into DX
        POP CX                     ; pop a value from STACK into CX
        POP BX                     ; pop a value from STACK into BX
        POP AX                     ; pop a value from STACK into AX

        RET                        ; return control to the calling procedure 
        
 BUBBLE_SORT ENDP     

END   MAIN

            
             