package CommonTestAbstract;

import java.io.OutputStream;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.Level;

public class LoggerOutputStream extends OutputStream {

    private final Logger logger;
    private final Level level;
    private final StringBuilder buffer = new StringBuilder();

    public LoggerOutputStream(Logger logger, Level level) {
        this.logger = logger;
        this.level = level;
    }

    @Override
    public void write(int b) {
        buffer.append((char) b); // just append, don’t flush on newline
    }

    @Override
    public void flush() {
        if (buffer.length() > 0) {
            logger.log(level, buffer.toString());
            buffer.setLength(0);
        }
    }

    @Override
    public void close() {
        flush();
    }
}