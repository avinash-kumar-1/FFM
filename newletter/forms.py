from django import forms

class ContactForm(forms.Form):
	full_name = forms.CharField()
	email  = forms.EmailField()
	message = forms.CharField()

	def clean_email(self):
		email = self.cleaned_data.get('email')
		email_base,provider = email.split('@')
		if 'com' not in provider:
			raise forms.ValidationError('Your email should have com domain')
		return email

		
