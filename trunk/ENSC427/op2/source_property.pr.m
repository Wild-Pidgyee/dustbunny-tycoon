MIL_3_Tfile_Hdr_ 140A 140A opnet 9 4BB508F3 4BB7D0D8 13 payette danh 0 0 none none 0 0 none 96CD3703 1DB8 0 0 0 0 0 0 18a9 3                                                                                                                                                                                                                                                                                                                                                                                                    ��g�      @  	I  	�  �  �  �  j  n  r  v  �  �  �  �      Property Key    �������    ����           ����          ����          ����           �Z             Property Update Interval   �������      seconds   �      constant (1.0)      ����      ����         bernoulli (mean)      bernoulli (mean)      $binomial (num_samples, success_prob)      $binomial (num_samples, success_prob)      chi_square (mean)      chi_square (mean)      constant (mean)      constant (mean)      erlang (scale, shape)      erlang (scale, shape)      exponential (mean)      exponential (mean)      extreme (location, scale)      extreme (location, scale)      fast_normal (mean, variance)      fast_normal (mean, variance)      gamma (scale, shape)      gamma (scale, shape)      geometric (success_prob)      geometric (success_prob)      laplace (mean, scale)      laplace (mean, scale)      logistic (mean, scale)      logistic (mean, scale)      lognormal (mean, variance)      lognormal (mean, variance)      normal (mean, variance)      normal (mean, variance)      pareto (location, shape)      pareto (location, shape)      poisson (mean)      poisson (mean)      power function (shape, scale)      power function (shape, scale)      rayleigh (mean)      rayleigh (mean)      triangular (min, max)      triangular (min, max)      uniform (min, max)      uniform (min, max)      uniform_int (min, max)      uniform_int (min, max)      weibull (shape, scale)      weibull (shape, scale)      scripted (filename)      scripted (filename)      None      None         Specifies the distribution    name and arguments to be    used for generating random    
outcomes.         While selecting a distribution,    replace the arguments within    parenthesis (e.g., mean,    variance, location, etc.) with    the desired numerical values.       For the special "scripted"    !distribution, specify a filename     (*.csv or *.gdf) containing the    values required as outcomes.     Values will be picked from this    file in cyclic order.   oms_dist_configure    oms_dist_conf_dbox_click_handler   $oms_dist_conf_dbox_new_value_handler���������Z             	Source ID    �������    ����           ����          ����          ����           �Z                Property Key    �������    ����           ����          ����          ����           �Z             	   begsim intrpt         
   ����   
   doc file            	nd_module      endsim intrpt             ����      failure intrpts            disabled      intrpt interval         ԲI�%��}����      priority              ����      recovery intrpts            disabled      subqueue                     count    ���   
   ����   
      list   	���   
          
      super priority             ����             int	\prop_key;       int	\prop_key_update_counter;       int	\prop_last_key_updated;       Objid	\self_id;       Evhandle	\next_update_evh;       "OmsT_Dist_Handle	\update_dist_ptr;       int	\source_id;              #include	<oms_dist_support.h>       8//Interrupt Codes (codes have no meaning and are random)    #define IC_PROP_VAL_CHANGED 		39    #define IC_UPDATES_DISABLE	 		83   #define IC_UPDATES_ENABLE			84       //Interrupts    i#define PROP_VAL_CHANGED	(op_intrpt_type() == OPC_INTRPT_SELF && op_intrpt_code() == IC_PROP_VAL_CHANGED)       n#define DISABLE_PROP_UPDATES	(op_intrpt_type() == OPC_INTRPT_REMOTE && op_intrpt_code() == IC_UPDATES_DISABLE)   m#define ENABLE_PROP_UPDATES		(op_intrpt_type() == OPC_INTRPT_REMOTE && op_intrpt_code() == IC_UPDATES_ENABLE)       void new_val(void);   void schedule_update(void);              void new_val(void)   {   	FIN (new_val ());       	prop_key_update_counter++;   	schedule_update();   	   	FOUT   }       void schedule_update(void)   {   	double next_update_time;   	   	FIN(schedule_update());   7	next_update_time = oms_dist_outcome (update_dist_ptr);       	if (next_update_time <0)   	{   		next_update_time = 0;   	}       i	next_update_evh      = op_intrpt_schedule_self (op_sim_time () + next_update_time, IC_PROP_VAL_CHANGED);       	FOUT;   }                                          Z   Z          J   init   J       J      char updatedist_str [128];       self_id = op_id_self();       7op_ima_obj_attr_get (self_id, "Source ID", &source_id);   9op_ima_obj_attr_get (self_id, "Property Key", &prop_key);   Jop_ima_obj_attr_get (self_id, "Property Update Interval", updatedist_str);       prop_key_update_counter = 1;   :prop_last_key_updated = 0; //So it gets updated right away       =update_dist_ptr = oms_dist_load_from_string (updatedist_str);           schedule_update();   J                     J   ����   J          pr_state           Z          J   active   J       J      Packet *pPkt;       4if(prop_key_update_counter != prop_last_key_updated)   {   1	prop_last_key_updated = prop_key_update_counter;   	   &	pPkt = op_pk_create_fmt("keyupdate");       5	op_pk_nfd_set_int32(pPkt, "source_id", source_id);		   -	op_pk_nfd_set_int32(pPkt, "key", prop_key);	   I	op_pk_nfd_set_int32(pPkt, "key_update_number", prop_key_update_counter);   	   %	op_pk_send(pPkt, 0); //Output stream   }   J                         ����             pr_state           �          J   disable   J       J      printf("DISABLE");   J                         ����             pr_state                        �   L      q   Z   �   \          J   tr_0   J       ����          ����          J    ����   J          ����                       pr_transition              |   �        h  0   �     �          J   tr_1   J       J   DISABLE_PROP_UPDATES   J       ����          J    ����   J          ����                       pr_transition                         L   �   )  #   )     J          J   tr_2   J       J   PROP_VAL_CHANGED   J       J   	new_val()   J       J    ����   J          ����                       pr_transition                6        �  )     �       �          J   tr_3   J       J   PROP_VAL_CHANGED   J       J   	new_val()   J       J    ����   J          ����                       pr_transition               �   �      �   �   �   �     b          J   tr_4   J       J   ENABLE_PROP_UPDATES   J       ����          J    ����   J          ����                       pr_transition              g   <        L  R   J  Q   _     V          J   tr_5   J       J   default   J       ����          J    ����   J          ����                       pr_transition              u   �         �  Q   �  H   �  %   �          J   tr_6   J       J   default   J       ����          J    ����   J          ����                       pr_transition                           oms_dist_support   oms_string_support                    