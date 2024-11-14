package com.example.demo.util;

public class Util {
	public static boolean isEmpty(String str) {

		if (str == null) {
			return true;
		}

		return str.trim().length() == 0;
	}

	public static String jsReplace(String msg, String uri) {
		if (msg == null) {
			msg = null;
		}

		if (uri == null) {
			uri = null;
		}

		return String.format("""
				<script>
					const msg = '%s'.trim();

					if (msg.length() > 0) {
						alert(msg);
					}

					location.relpace('%s');
				</script>
				""", msg, uri);
	}
}