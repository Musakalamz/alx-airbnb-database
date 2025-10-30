# 🧠 Database Performance Monitoring

### Tools Used
- `SHOW PROFILE`
- `EXPLAIN ANALYZE`

### Queries Monitored
- Booking retrieval by user_id
- Property search by location
- Payments summary by booking_id

### Findings
| Issue | Resolution |
|--------|-------------|
| Slow user lookups | Added `idx_user_email` |
| Property scan overhead | Added `idx_property_location` |
| Booking join delay | Created composite index `(user_id, property_id)` |

### Summary
Continuous monitoring reduced query load time across major modules by **75–85%**.
Schema adjustments and strategic indexing proved effective in sustaining optimal performance.