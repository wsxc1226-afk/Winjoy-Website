// Function to compare the values of two password input fields and display the result
function compareTextValues() {
    // Get the values of the password fields and the result element
    var value1 = document.getElementById('signup-password').value;
    var value2 = document.getElementById('signup-password2').value;
    var resultElement = document.getElementById('result');

    // Compare the values and update the result element accordingly
    if (value1 === value2) {
        resultElement.innerText = 'Password match!';
    } else {
        resultElement.innerText = 'Passwords do not match.';
    }
}

// Function to validate the form by checking if the passwords match
function validateForm() {
    // Get the values of the password fields
    var password = document.getElementById('signup-password').value;
    var password2 = document.getElementById('signup-password2').value;

    // Check if the passwords do not match and display an alert
    if (password !== password2) {
        alert('Please check your confirm password part!!');
        return false; // Prevent form submission if passwords do not match
    }
}

// Event listeners to trigger the compareTextValues function when the user types in the password fields
document.getElementById('signup-password').addEventListener('keyup', compareTextValues);
document.getElementById('signup-password2').addEventListener('keyup', compareTextValues);

    
    