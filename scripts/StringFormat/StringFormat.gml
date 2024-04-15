function StringFormat(num)
{
	var s = string_format(num, 0, 15);
	var d = string_pos(".", s);
	if d > 0
	{
	    for (var i = string_length(s); i > d; i -= 1)
		{
	        if (string_ord_at(s, i) != ord("0"))
			{
	            return string_copy(s, 1, i);
	        }
	    }
	    return string_copy(s, 1, d - 1);
	}
	return s;
}