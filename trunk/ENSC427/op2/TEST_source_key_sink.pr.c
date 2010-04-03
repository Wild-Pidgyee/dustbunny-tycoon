/* Process model C form file: TEST_source_key_sink.pr.c */
/* Portions of this file copyright 1992-2007 by OPNET Technologies, Inc. */



/* This variable carries the header into the object file */
const char TEST_source_key_sink_pr_c [] = "MIL_3_Tfile_Hdr_ 140A 30A opnet 7 4BB7D1AD 4BB7D1AD 1 payette danh 0 0 none none 0 0 none 0 0 0 0 0 0 0 0 18a9 3                                                                                                                                                                                                                                                                                                                                                                                                               ";
#include <string.h>



/* OPNET system definitions */
#include <opnet.h>

#if !defined (VOSD_NO_FIN)
#undef	BIN
#undef	BOUT
#define	BIN		FIN_LOCAL_FIELD(_op_last_line_passed) = __LINE__ - _op_block_origin;
#define	BOUT	BIN
#define	BINIT	FIN_LOCAL_FIELD(_op_last_line_passed) = 0; _op_block_origin = __LINE__;
#else
#define	BINIT
#endif /* #if !defined (VOSD_NO_FIN) */



/* State variable definitions */
typedef struct
	{
	/* Internal state tracking for FSM */
	FSM_SYS_STATE
	/* State Variables */
	Stathandle	             		s1k1_stathandle                                 ;
	Stathandle	             		s1k2_stathandle                                 ;
	Stathandle	             		s1k3_stathandle                                 ;
	Stathandle	             		unknown_stathandle                              ;
	} TEST_source_key_sink_state;

#define s1k1_stathandle         		op_sv_ptr->s1k1_stathandle
#define s1k2_stathandle         		op_sv_ptr->s1k2_stathandle
#define s1k3_stathandle         		op_sv_ptr->s1k3_stathandle
#define unknown_stathandle      		op_sv_ptr->unknown_stathandle

/* These macro definitions will define a local variable called	*/
/* "op_sv_ptr" in each function containing a FIN statement.	*/
/* This variable points to the state variable data structure,	*/
/* and can be used from a C debugger to display their values.	*/
#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE
#define FIN_PREAMBLE_DEC	TEST_source_key_sink_state *op_sv_ptr;
#define FIN_PREAMBLE_CODE	\
		op_sv_ptr = ((TEST_source_key_sink_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr));


/* No Function Block */

#if !defined (VOSD_NO_FIN)
enum { _op_block_origin = __LINE__ };
#endif

/* Undefine optional tracing in FIN/FOUT/FRET */
/* The FSM has its own tracing code and the other */
/* functions should not have any tracing.		  */
#undef FIN_TRACING
#define FIN_TRACING

#undef FOUTRET_TRACING
#define FOUTRET_TRACING

#if defined (__cplusplus)
extern "C" {
#endif
	void TEST_source_key_sink (OP_SIM_CONTEXT_ARG_OPT);
	VosT_Obtype _op_TEST_source_key_sink_init (int * init_block_ptr);
	void _op_TEST_source_key_sink_diag (OP_SIM_CONTEXT_ARG_OPT);
	void _op_TEST_source_key_sink_terminate (OP_SIM_CONTEXT_ARG_OPT);
	VosT_Address _op_TEST_source_key_sink_alloc (VosT_Obtype, int);
	void _op_TEST_source_key_sink_svar (void *, const char *, void **);


#if defined (__cplusplus)
} /* end of 'extern "C"' */
#endif




/* Process model interrupt handling procedure */


void
TEST_source_key_sink (OP_SIM_CONTEXT_ARG_OPT)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	FIN_MT (TEST_source_key_sink ());

		{


		FSM_ENTER_NO_VARS ("TEST_source_key_sink")

		FSM_BLOCK_SWITCH
			{
			/*---------------------------------------------------------*/
			/** state (DISCARD) enter executives **/
			FSM_STATE_ENTER_UNFORCED (0, "DISCARD", state0_enter_exec, "TEST_source_key_sink [DISCARD enter execs]")

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (1,"TEST_source_key_sink")


			/** state (DISCARD) exit executives **/
			FSM_STATE_EXIT_UNFORCED (0, "DISCARD", "TEST_source_key_sink [DISCARD exit execs]")
				FSM_PROFILE_SECTION_IN ("TEST_source_key_sink [DISCARD exit execs]", state0_exit_exec)
				{
				Packet *pPkt;
				int source_id;
				int key;
				
				char message[255];
				
				pPkt = op_pk_get (op_intrpt_strm ());
				
				op_pk_nfd_get(pPkt, "source_id", &source_id);
				op_pk_nfd_get(pPkt, "key", &key);
				
				printf("Got pkt\n");
				
				if(source_id == 1)
				{
					//printf("\tSource 1\n");
					if(key == 1)
					{
						//printf("\tKey 1\n");
						op_stat_write (s1k1_stathandle, 	1.0);
					}
					else if(key == 2)
					{
						//printf("\tKey 2\n");	
						op_stat_write (s1k2_stathandle, 	1.0);
					}
					else if(key == 3)
					{
						//printf("\tKey 3\n");
						op_stat_write (s1k3_stathandle, 	1.0);
					}
					else 
					{
						printf("\tKey Unknown\n");	
						op_stat_write (unknown_stathandle, 1.0);
					}
				}
				else 
				{
					printf("\tSource Unknown\n");
					op_stat_write (unknown_stathandle, 1.0);
				}
					
				op_pk_destroy (pPkt);
				}
				FSM_PROFILE_SECTION_OUT (state0_exit_exec)


			/** state (DISCARD) transition processing **/
			FSM_TRANSIT_FORCE (0, state0_enter_exec, ;, "default", "", "DISCARD", "DISCARD", " ", "TEST_source_key_sink [DISCARD -> DISCARD : default / ]")
				/*---------------------------------------------------------*/



			/** state (INIT) enter executives **/
			FSM_STATE_ENTER_FORCED_NOLABEL (1, "INIT", "TEST_source_key_sink [INIT enter execs]")
				FSM_PROFILE_SECTION_IN ("TEST_source_key_sink [INIT enter execs]", state1_enter_exec)
				{
				s1k1_stathandle 		= op_stat_reg ("S1K1 Received",		OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);
				s1k2_stathandle 		= op_stat_reg ("S1K2 Received",		OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);
				s1k3_stathandle 		= op_stat_reg ("S1K3 Received",		OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);
				unknown_stathandle 		= op_stat_reg ("Unknown Received",		OPC_STAT_INDEX_NONE, OPC_STAT_LOCAL);
				}
				FSM_PROFILE_SECTION_OUT (state1_enter_exec)

			/** state (INIT) exit executives **/
			FSM_STATE_EXIT_FORCED (1, "INIT", "TEST_source_key_sink [INIT exit execs]")


			/** state (INIT) transition processing **/
			FSM_TRANSIT_FORCE (0, state0_enter_exec, ;, "default", "", "INIT", "DISCARD", "tr_12", "TEST_source_key_sink [INIT -> DISCARD : default / ]")
				/*---------------------------------------------------------*/



			}


		FSM_EXIT (1,"TEST_source_key_sink")
		}
	}




void
_op_TEST_source_key_sink_diag (OP_SIM_CONTEXT_ARG_OPT)
	{
	/* No Diagnostic Block */
	}




void
_op_TEST_source_key_sink_terminate (OP_SIM_CONTEXT_ARG_OPT)
	{

	FIN_MT (_op_TEST_source_key_sink_terminate ())


	/* No Termination Block */

	Vos_Poolmem_Dealloc (op_sv_ptr);

	FOUT
	}


/* Undefine shortcuts to state variables to avoid */
/* syntax error in direct access to fields of */
/* local variable prs_ptr in _op_TEST_source_key_sink_svar function. */
#undef s1k1_stathandle
#undef s1k2_stathandle
#undef s1k3_stathandle
#undef unknown_stathandle

#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE

#define FIN_PREAMBLE_DEC
#define FIN_PREAMBLE_CODE

VosT_Obtype
_op_TEST_source_key_sink_init (int * init_block_ptr)
	{
	VosT_Obtype obtype = OPC_NIL;
	FIN_MT (_op_TEST_source_key_sink_init (init_block_ptr))

	obtype = Vos_Define_Object_Prstate ("proc state vars (TEST_source_key_sink)",
		sizeof (TEST_source_key_sink_state));
	*init_block_ptr = 2;

	FRET (obtype)
	}

VosT_Address
_op_TEST_source_key_sink_alloc (VosT_Obtype obtype, int init_block)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	TEST_source_key_sink_state * ptr;
	FIN_MT (_op_TEST_source_key_sink_alloc (obtype))

	ptr = (TEST_source_key_sink_state *)Vos_Alloc_Object (obtype);
	if (ptr != OPC_NIL)
		{
		ptr->_op_current_block = init_block;
#if defined (OPD_ALLOW_ODB)
		ptr->_op_current_state = "TEST_source_key_sink [INIT enter execs]";
#endif
		}
	FRET ((VosT_Address)ptr)
	}



void
_op_TEST_source_key_sink_svar (void * gen_ptr, const char * var_name, void ** var_p_ptr)
	{
	TEST_source_key_sink_state		*prs_ptr;

	FIN_MT (_op_TEST_source_key_sink_svar (gen_ptr, var_name, var_p_ptr))

	if (var_name == OPC_NIL)
		{
		*var_p_ptr = (void *)OPC_NIL;
		FOUT
		}
	prs_ptr = (TEST_source_key_sink_state *)gen_ptr;

	if (strcmp ("s1k1_stathandle" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->s1k1_stathandle);
		FOUT
		}
	if (strcmp ("s1k2_stathandle" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->s1k2_stathandle);
		FOUT
		}
	if (strcmp ("s1k3_stathandle" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->s1k3_stathandle);
		FOUT
		}
	if (strcmp ("unknown_stathandle" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->unknown_stathandle);
		FOUT
		}
	*var_p_ptr = (void *)OPC_NIL;

	FOUT
	}

