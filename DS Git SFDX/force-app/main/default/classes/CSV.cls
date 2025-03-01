public class CSV {
    public String generate() {
        list<Contact> contacts=[select FirstName,LastName,Birthdate,Email,Phone from Contact limit 5];
        String s = line(new String[] {
                format('First Name'),
                format('Last Name'),
                format('Birthdate'),
                format('Email'),
                format('Phone')
                });
        for (Contact c : contacts) {
            s += line(new String[] {
                    format(c.FirstName),
                    format(c.LastName),
                    format(c.Birthdate),
                    format(c.Email),
                    format(c.Phone)
                    });
        }
        return s;
    }
    private String line(String[] cells) {
        return String.join(cells, ',') + '\n';
    }
    private String format(Date d)    {
        return d != null ? '"' + d.format().escapeCsv() + '"' : '""';
    }
    private String format(String s) {
        return s != null ? '"' + s.escapeCsv() + '"' : '""';
    }
    private String format(Decimal d, Integer scale) {
        return d != null ? String.valueOf(d.setScale(scale)) : '';
    }
    private String format(Decimal d) {
        return format(d, 2);
    }
}